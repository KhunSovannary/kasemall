import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/multipart/form_data.dart';
import 'package:get/route_manager.dart';
//import 'package:image_picker/image_picker.dart';
//import 'package:kasemall/account/files_page.dart';
import 'package:kasemall/api_service/api_data.dart';
import 'package:kasemall/login/login_screen.dart';
import 'package:kasemall/shopping/shopping_screen.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
//import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart';

import 'package:flutter/cupertino.dart';
import 'package:kasemall/account/image_function.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class Seller extends StatefulWidget {
  Seller({key, required this.title}) : super(key: key);

  final String title;

  @override
  _SellerState createState() => _SellerState();
}

class _SellerState extends State<Seller> {
  //ImageController imageController = new ImageController();
  TextEditingController _shopname = new TextEditingController();
  List<String>? _filename;

  final imageController = Get.put(ImageController());
  //String _filename;
  String? _membership;
  String? _supplier;
  Province? _cityprovince;
  String?_district;
  String? _address;
  List<File>? selectedfile;
  @override
  void initState() {
    super.initState();
    //getProvinces();

    print('1');
  }

  void dropChange(String vaL) {}
  @override
  List<Province> provinces = [];
  /*void getProvinces() {
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
  }*/
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
                 // onChanged: dropChange,
                  decoration: InputDecoration(
                    border: InputBorder.none,
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
                SizedBox(height: 7),]))])));}}
                
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

                /*DropdownButtonFormField<String>(
                  hint: Text("City/Province"),
                  decoration: InputDecoration(
                    border: InputBorder.none,
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
                      //_cityprovince = provinces.where((province)=>"${province.id}"==pro).toList();

                      getDistricts(pro);
                    });
                  },*/
                
                //SizedBox(height: 7),
                /*DropdownButtonFormField(
                  hint: Text("District"),
                  //onChanged: dropChange,
                  decoration: InputDecoration(
                    border: InputBorder.none,
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
                  }).toList(),),*/ 

                /*SizedBox(height: 7),
                DropdownButtonFormField(
                  hint: Text("Address"),
                  //onChanged: dropChange,
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
                ),*/
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
              /*]),
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
                  child: Text("Upload Required Information",
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
                            /* Get.defaultDialog(
                                title: 'Select Option',
                                content: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SimpleDialogOption(
                                      onPressed: () {
                                        // Navigator.pop(context, Department.treasury);
                                      },
                                      child: const Text('Images'),
                                    ),
                                    SimpleDialogOption(
                                      onPressed: () {
                                        //Navigator.pop(context, Department.state);
                                        selectFile();
                                      },
                                      child: const Text('Files'),
                                    ),
                                  ],
                                ));
                            //selectFile();
                            /* File selectedfile =
                                await FilePicker.getFile(
                                type: FileType.custom,
                                allowedExtensions: ['jpg','jpeg'],
                                );
                            /*FilePickerResult result = await FilePicker.platform
                                .pickFiles(allowMultiple: true);
                            if (result != null) {
                              print("okay");
*/                          if(selectedfile!=null){
                              setState(() {
                              _filename = basename(selectedfile.path);
                               /* List<PlatformFile> files =
                                    result.files.toList();
                                _filename = files
                                    .map((PlatformFile file) => file.name)
                                    .toList();
                              });
                            } else {
                              print(result);*/
});}
                                else
                              print("failed");*/
                          */
                          }
                          /* final result = await FilePicker.platform
                              .pickFiles(allowMultiple: true);
                          if (result == null) return;
                          final file = result.files.first;
                          openFile(result.files);
                          final newFile = await saveFilePermanently(file);*/
                          ,
                          child: Text("Upload your logo here"),
                          color: Colors.green,
                        ),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(()=>imageController.selectedImagePath.value==''?
                              Text('Select image from gallery'):
                              Image.file(File(imageController.selectedImagePath.value)))
                              /*Image.file(
                                           File(imageController.selectedImagePath.value),
                                          width: double.infinity,
                                          height: 300,
                                              ),*/

                              // getFile(_filename)

                              /*Icon(Icons.file_present),
                              Text("$_filename"),*/
                              /*Text("File 1"),
                            Text("File 2"),*/
                            ])
                      ]),
                )
              ]),
        )
      ])),
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

  /*void openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }
*/
  /* void openFiles(List<PlatformFile> files) => Get.to(() => FilesPage(
        files: files,
        onOpenedFile: openFile,
      ));*/
  /*Future<File> saveFilePermanently(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.name}');

    return File(file.path).copy(newFile.path);
  }
  
  Widget buildFile(PlatformFile file) {
    final kb = file.size / 1024;
    final mb = kb / 1024;
    final fileSize =
        mb >= 1 ? '${mb.toStringAsFixed(2)}MB' : '${kb.toStringAsFixed(2)}KB';
    final extension = file.extension ?? 'none';
    final color = Colors.green;
    return InkWell(
      onTap: () => widget.onOpenedFile(file),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
              child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '.$extension',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          )),
          const SizedBox(height: 8),
          Text(
            file.name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            fileSize,
            style: TextStyle(fontSize: 16),*/
          ),
        ]),
      ),
    );
  }
}

  // void openFiles(List<PlatformFile> files) =>
  selectFile() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: true,
      allowedExtensions: ['jpg', 'pdf', 'mp4', 'docx'],
      //allowed extension to choose
    );

    if (result != null) {
      //if there is selected file
      selectedfile =
          result.files.map((PlatformFile file) => File(file.path)).toList();

      setState(() {
        _filename = result.files
            .map((PlatformFile file) => basename(file.path))
            .toList();

        print(selectedfile);
      });
    }
    //allowed extension to choose
  }
}

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
