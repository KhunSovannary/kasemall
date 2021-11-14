import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/multipart/form_data.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kasemall/account/controller/seller_api_controller.dart';
import 'package:kasemall/account/controller/seller_controller.dart';
//import 'package:image_picker/image_picker.dart';
//import 'package:kasemall/account/files_page.dart';
import 'package:kasemall/api_service/api_data.dart';
import 'package:kasemall/login/login_screen.dart';
import 'package:kasemall/shopping/shopping_screen.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io' as file;
//import "dart:html"; 
//import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart';

import 'package:flutter/cupertino.dart';
import 'package:kasemall/account/image_function.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Seller extends StatefulWidget {
  Seller({key, required this.title}) : super(key: key);

  final String title;

  @override
  _SellerState createState() => _SellerState();
}

class _SellerState extends State<Seller> {
  // this is creating an instance of class
  ImageController imageController = new ImageController();

  TextEditingController _shopname = new TextEditingController();
  List<String> _filename = [];
  late file.File logo;
  late file.File cover;
  // inject your dependency -> ImageController
  final imageController1 = Get.put(ImageController());

  final imageController2 = Get.put(ImageController());
  //String _filename;
  String pro = '1';
  String? _membership;
  String? _supplier;
  String? _cityprovince;
  String? _district;
  String? _address;
  List<file.File>? selectedfile;
  @override
  void initState() {
    super.initState();
  }

  @override
  List<Province>? provinces = [];
  void getProvinces() {
    Province.connectToAPI().then((hasil) {
      setState(() {
        provinces = hasil;
      });
    });
  }

  void dropChange(String? val) {}
  List<District>? districts = [];
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
  // getProvinces();

  final sellerController = Get.put(SellerController());

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
          child: Column(children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          // borderOnForeground: true,
          elevation: 4.0,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      color: Colors.grey[300]),
                  height: 50,
                  // color: Colors.grey[300],
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  //color:Colors.green,
                  child: Text("Shop Information",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                SizedBox(height: 7),
                //Image(image: AssetImage("lib/assets/logo1.jpg")),
                TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,

                    hintText: "Shop Name",
                    prefixIcon: Icon(Icons.store, size: 30),
                    isDense: true, // Added this
                    contentPadding: EdgeInsets.all(10),
                  ),
                  controller: _shopname,
                ),
                SizedBox(height: 7),
                DropdownButtonFormField(
                  hint: Text("Memebership"),
                  onChanged: (String? val) {
                    _membership = val;
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.people),
                    isDense: true, // Added this
                    contentPadding: EdgeInsets.all(10),
                  ),
                  value: _membership,
                  items: <String>['1', '2']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      child: Text(value),
                      value: value,
                    );
                  }).toList(),
                ),
                SizedBox(height: 7),

                DropdownButtonFormField(
                  hint: Text("Supplier"),
                  onChanged: (String? val) {
                    _supplier = val;
                  },
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
                SizedBox(height: 7),

                SizedBox(height: 10),
                GetX<SellerController>(
                  builder: (controller) {
                    return DropdownButtonFormField<String>(
                      hint: Text("City/Province"),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.add_location),
                        //hintText: "City/Province",
                        isDense: true, // Added this
                        contentPadding: EdgeInsets.all(10),
                      ),
                      value: null,
                      items: controller.provinces
                          .map<DropdownMenuItem<String>>((dynamic provinces) {
                        return DropdownMenuItem<String>(
                          child: Text(provinces.default_name),
                          value: "${provinces.id}",
                        );
                      }).toList(),
                      onChanged: (String? val) {
                        setState(() {
                          _cityprovince = val;
                          String pro = val!;
                          sellerController.getDistricts(pro);
                          setState(() {
                            _district = null;
                          });
                          //_cityprovince = provinces.where((province)=>"${province.id}"==pro).toList();
                        });
                      },
                    );
                  },
                ),
                SizedBox(height: 7),
                Obx(() => DropdownButtonFormField<String>(
                      hint: Text("District"),
                      onChanged: (String? district) {
                        setState(() {
                          _district = district;
                        });
                      },
                      onSaved: (String? val) {},
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon:
                            Icon(Icons.add_location), // hintText: "District",
                        isDense: true, // Added this
                        contentPadding: EdgeInsets.all(10),
                      ),
                      value: _district ?? null,
                      items: sellerController.districts
                          .map<DropdownMenuItem<String>>((District districts) {
                        return DropdownMenuItem<String>(
                          child: Text(districts.default_name),
                          value: " ${districts.id}",
                        );
                      }).toList(),
                    )),
                SizedBox(height: 7),
                DropdownButtonFormField(
                  hint: Text("Address"),
                  onChanged: (String? val) {
                    setState(() {
                      _address = val;
                    });
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
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
              ]),
        ),
        Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            // borderOnForeground: true,
            elevation: 4.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      color: Colors.grey[300]),
                  height: 50,
                  // color: Colors.grey[300],
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  //color:Colors.green,
                  child: Text("Upload Required Photo",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FlatButton(
                          onPressed: () {
                            imageController.getPic(ImageSource.gallery);
                          },
                          child: Text("Upload your logo here"),
                          color: Colors.green,
                        ),
                        FlatButton(
                            onPressed: () {
                              imageController1.getPic(ImageSource.gallery);
                            },
                            child: Text("Upload your cover here"),
                            color: Colors.green[100]),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(() =>
                                  imageController.selectedImagePath.value == ''
                                      ? Text('Select image from gallery')
                                      : Image.file(file.
                                          File(imageController
                                              .selectedImagePath.value),
                                          scale: 0.9,
                                        )),
                              Obx(() =>
                                  imageController1.selectedImagePath.value == ''
                                      ? Text('Select image from gallery')
                                      : Image.file(file.
                                          File(imageController1
                                              .selectedImagePath.value),
                                          scale: 0.9,
                                        ))
                            ]),
                      ]),
                )
              ],
            )),
      ])),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
           /* logo = file.File(imageController.selectedImagePath.value);
            cover = file.File(imageController1.selectedImagePath.value);*/
          });
          print("Done");
          SharedPreferences prefs = await SharedPreferences.getInstance();
          String? phone = prefs.getString('phone');
          /*openShop(_shopname.text, phone!, _membership!, _cityprovince!,
              _district!, _supplier!, _address!, logo, cover);*/
          // getProvinces();
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
  /*void openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }
*/
  /*
Widget getFile(List<String> strings) {
  List<Widget> list = new List<Widget>();
  for (var i = 0; i < strings.length; i++) {
    list.add(new Column(children: [
      Row(children: [
        Icon(
          Icons.file_present,
          size: 50,
        ),
        Expanded(child: Text(strings[i])),
        SizedBox(
          height: 10,
        )
      ]),
      SizedBox(height: 5)
    ]));
  }
  return new Column(children: list);
}*/
