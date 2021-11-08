import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:kasemall/api_service/api_data.dart';
import 'package:kasemall/login/login_screen.dart';
import 'package:kasemall/shopping/shopping_screen.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

class Seller extends StatefulWidget {
  Seller({key, this.title}) : super(key: key);

  final String title;

  @override
  _SellerState createState() => _SellerState();
}

class _SellerState extends State<Seller> {
  TextEditingController _shopname = new TextEditingController();
  String _membership;
  String _supplier;
  String _cityprovince;
  String _district;
  String _address;
  @override
  void initState() {
    super.initState();
    getProvinces();

    print('1');
  }

  void dropChange(String vaL) {}
  @override
  List<Province> provinces = [];
  void getProvinces() {
    Province.connectToAPI().then((hasil) {
      setState(() {
        provinces = hasil;
      });
    });
  }

  List<District> districts = [];
  void getDistricts(String p) {
    District.connectToAPI(p).then((hasil) {
      setState(() {
        districts = hasil;
      });
    });
  }
  /* void getListAPI() {
    Provinces.getData().then((hasil) {
      list = hasil;
      setState(() {});
    });
  }*/

  /* List<String> provinces = [];
  void getP() {
    getListAPI();
    for (int i = 0; i < list.length; i++) provinces.add(list[i].name);
  }*/

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("${widget.title}",
            style: TextStyle(fontSize: 20, color: Colors.green)),
        leading: BackButton(
          color: Colors.green,
        ),
      ),
      body: SingleChildScrollView(
        child: Card(
          borderOnForeground: true,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20),
                Text("Shop Information",
                    style: TextStyle(
                      fontSize: 17,
                    )),
                SizedBox(height: 10),
                //Image(image: AssetImage("lib/assets/logo1.jpg")),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),

                    hintText: "Shop Name",
                    prefixIcon: Icon(Icons.store, size: 30),
                    isDense: true, // Added this
                    contentPadding: EdgeInsets.all(10),
                  ),
                  controller: _shopname,
                ),
                SizedBox(height: 10),
                DropdownButtonFormField(
                  hint: Text("Memebership"),
                  onChanged: dropChange,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.people),
                    isDense: true, // Added this
                    contentPadding: EdgeInsets.all(10),
                  ),
                  value: _membership,
                  items: <String>['Member1', 'Member2']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      child: Text(value),
                      value: value,
                    );
                  }).toList(),
                ),
                SizedBox(height: 10),
                /* DropdownButtonFormField(
                  hint: Text("Supplier"),
                  onChanged: dropChange,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.store), //hintText: "Supplier",
                    isDense: true, // Added this
                    contentPadding: EdgeInsets.all(10),
                  ),
                  value: _supplier,
                  items: <String>['Seller1', 'Seller2']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      child: Text(value),
                      value: value,
                    );
                  }).toList(),
                ),
                SizedBox(height: 10),*/
                DropdownButtonFormField<String>(
                  hint: Text("City/Province"),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.add_location),
                    //hintText: "City/Province",
                    isDense: true, // Added this
                    contentPadding: EdgeInsets.all(10),
                  ),
                  value: null,
                  items: provinces
                      .map<DropdownMenuItem<String>>((Province provinces) {
                    return DropdownMenuItem<String>(
                      child: Text(provinces.default_name),
                      value: "${provinces.id}",
                    );
                  }).toList(),
                  onChanged: (String val) {
                    setState(() {
                      String pro = val;
                      print(pro);
                      getDistricts(pro);
                    });
                  },
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  hint: Text("District"),
                  onChanged: dropChange,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon:
                        Icon(Icons.add_location), // hintText: "District",
                    isDense: true, // Added this
                    contentPadding: EdgeInsets.all(10),
                  ),
                  value: null,
                  items: districts
                      .map<DropdownMenuItem<String>>((District districts) {
                    return DropdownMenuItem<String>(
                      child: Text(districts.default_name),
                      value: districts.default_name,
                    );
                  }).toList(),
                ),
                SizedBox(height: 10),
                DropdownButtonFormField(
                  hint: Text("Address"),
                  onChanged: dropChange,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon:
                        Icon(Icons.add_location), // hintText: "Address",
                    isDense: true, // Added this
                    contentPadding: EdgeInsets.all(10),
                  ),
                  value: _address,
                  items: <String>['Address1', 'Address2']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      child: Text(value),
                      value: value,
                    );
                  }).toList(),
                ),
                /*TextFormField(
                  decoration: InputDecoration(
                    labelText: "Supplier",
                  ),
                  controller: _supplier,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "City/Province",
                  ),
                  controller: _cityprovince,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Address",
                  ),
                  controller: _address,
                ),*/
              ]),
        ),
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Done");
          getProvinces();
          // getDistricts();
          // Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
          //Get.to(() => Shop());
        },
        child: const Icon(Icons.check),
        backgroundColor: Colors.green,
      ),
    );
  }
}
