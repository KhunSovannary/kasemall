import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:kasemall/login/login_screen.dart';
import 'package:kasemall/shopping/shopping_screen.dart';

class Seller extends StatefulWidget {
  Seller({key, this.title}) : super(key: key);

  final String title;

  @override
  _SellerState createState() => _SellerState();
}

class _SellerState extends State<Seller> {
  TextEditingController _shopname = new TextEditingController();
  String _membership = "Member1";
  String _supplier = "Seller1";
  String _cityprovince = "City1";
  String _district = "District1";
  String _address = "Address1";

  void dropChange(String vaL) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
            child: Card(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //Image(image: AssetImage("lib/assets/logo1.jpg")),
                SizedBox(height: 20),
                Text("${widget.title}"),
                SizedBox(height: 15),
                TextFormField(
                  decoration: InputDecoration(
                    prefix: Icon(Icons.storefront),
                    hintText: "Shop Name",
                  ),
                  controller: _shopname,
                ),
                DropdownButtonFormField(
                  onChanged: dropChange,
                  decoration: InputDecoration(
                      prefix: Icon(Icons.people), hintText: "Memebership"),
                  value: _membership,
                  items: <String>['Member1', 'Member2']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      child: Text(value),
                      value: value,
                    );
                  }).toList(),
                ),
                DropdownButtonFormField(
                  onChanged: dropChange,
                  decoration: InputDecoration(
                      prefix: Icon(Icons.store), hintText: "Supplier"),
                  value: _supplier,
                  items: <String>['Seller1', 'Seller2']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      child: Text(value),
                      value: value,
                    );
                  }).toList(),
                ),
                DropdownButtonFormField(
                  onChanged: dropChange,
                  decoration: InputDecoration(
                      prefix: Icon(Icons.location_city),
                      hintText: "City/Province"),
                  value: _cityprovince,
                  items: <String>['City1', 'City2']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      child: Text(value),
                      value: value,
                    );
                  }).toList(),
                ),
                DropdownButtonFormField(
                  onChanged: dropChange,
                  decoration: InputDecoration(
                      prefix: Icon(Icons.location_city), hintText: "District"),
                  value: _district,
                  items: <String>['District1', 'District2']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      child: Text(value),
                      value: value,
                    );
                  }).toList(),
                ),
                 DropdownButtonFormField(
                  onChanged: dropChange,
                  decoration: InputDecoration(
                      prefix: Icon(Icons.location_city), hintText: "Address"),
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
        )),
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Done");
          // Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
          Get.back();
        },
        child: const Icon(Icons.check),
        backgroundColor: Colors.green,
      ),
    );
  }
}
