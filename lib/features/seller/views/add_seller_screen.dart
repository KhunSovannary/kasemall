import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kasemall/api_service/api_data.dart';
import 'package:kasemall/features/city_province/controller/city_controller.dart';
import 'package:kasemall/features/district/controller/district_controller.dart';
import 'package:kasemall/features/seller/controller/seller_controller.dart';

class AddSellerScreen extends StatelessWidget {
  AddSellerScreen({Key? key}) : super(key: key);

  final saleController = Get.put(SellerController());
  final districtController = Get.put(DistrictController());
  final cityProvinceController = Get.put(CityProvinceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title:
            Text("Seller", style: TextStyle(fontSize: 20, color: Colors.green)),
        leading: BackButton(
          color: Colors.green,
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.edit))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                  TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Shop Name",
                      prefixIcon: Icon(Icons.store, size: 30),
                      isDense: true, // Added this
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                  SizedBox(height: 7),
                  DropdownButtonFormField<String>(
                    hint: Text("Memebership"),
                    onChanged: (String? val) {
                      // _membership = val;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.people),
                      isDense: true, // Added this
                      contentPadding: EdgeInsets.all(10),
                    ),
                    value: null,
                    items: <String>['1', '2']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        child: Text(value),
                        value: value,
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 7),
                  DropdownButtonFormField<String>(
                    hint: Text("Supplier"),
                    onChanged: (String? val) {
                      // _supplier = val;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.store), //hintText: "Supplier",
                      isDense: true, // Added this
                      contentPadding: EdgeInsets.all(10),
                    ),
                    value: null,
                    items: <String>['1', '2']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        child: Text(value),
                        value: value,
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 7),
                  SizedBox(height: 10),
                  GetX<CityProvinceController>(
                    builder: (controller) {
                      return DropdownButtonFormField<String>(
                        hint: Text("City/Province"),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.add_location),
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
                        onChanged: (String? val) {},
                      );
                    },
                  ),
                  SizedBox(height: 7),
                  Obx(
                    () => DropdownButtonFormField<int>(
                      hint: Text("District"),
                      onChanged: (int? district) {
                        // saleController.setSaler()
                      },
                      onSaved: (int? val) {},
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon:
                            Icon(Icons.add_location), // hintText: "District",
                        isDense: true, // Added this
                        contentPadding: EdgeInsets.all(10),
                      ),
                      value: null,
                      items: districtController.district
                          .map<DropdownMenuItem<int>>((District district) {
                        return DropdownMenuItem<int>(
                          child: Text(district.default_name),
                          value: district.id,
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 7),
                  DropdownButtonFormField<String>(
                    hint: Text("Address"),
                    onChanged: (String? address) {},
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon:
                          Icon(Icons.add_location), // hintText: "Address",
                      isDense: true, // Added this
                      contentPadding: EdgeInsets.all(10),
                    ),
                    value: null,
                    items: <String>['Address1', 'Address2']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        child: Text(value),
                        value: value,
                      );
                    }).toList(),
                  ),
                ],
              ),
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
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Text("Upload Required Photo",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
        child: const Icon(Icons.check),
        backgroundColor: Colors.green,
      ),
    );
  }
}
