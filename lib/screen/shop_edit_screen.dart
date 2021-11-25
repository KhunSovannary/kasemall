import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kasemall/controller/seller_controller.dart';
import 'package:kasemall/controller/updateshop_controller.dart';
//import 'package:kasemall/account/image/image_viewer.dart';
import 'package:kasemall/controller/shop_edit_controller.dart';
import 'package:kasemall/repository/shop_repository.dart';
import 'package:kasemall/screen/shop_view_screen.dart';
import 'package:kasemall/api_service/api_data.dart';
import 'package:kasemall/model/seller_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class myShopEdit extends StatefulWidget {
  @override
  Seller seller;
  myShopEdit({required this.seller});
  _myShopEditState createState() => _myShopEditState();
}

class _myShopEditState extends State<myShopEdit> {
  final ShopRepository shopRepository = ShopRepository();
  final shopedit = Get.put(ShopEditController());
  late Seller seller;
  late UpdateShop updateShop = Get.put(UpdateShop(seller));
  final sellerController = Get.put(SellerController());

  // use local state
  String? _districtId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    seller = widget.seller;
    shopedit.shopname.value = widget.seller.name!;
    shopedit.membership_id.value = "${widget.seller.membership_id!}";
    shopedit.supplier_id.value = "${widget.seller.supplier_id!}";
    shopedit.city_province_id.value = "${widget.seller.city_province_id!}";
    shopedit.district_id.value = "${widget.seller.district_id!}";
    shopedit.address.value = "${widget.seller.address!}";
    shopedit.logo_image.value = "${widget.seller.logo_image}";
    shopedit.cover_image.value = "${widget.seller.cover_image!}";
    sellerController.getDistricts("${seller.city_province_id}");
    _districtId = "${widget.seller.district_id}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Shop Information",
            style: TextStyle(fontSize: 20, color: Colors.green)),
        leading: IconButton(
          onPressed: () {
            Get.back(result: seller);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.green,
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  seller.name = shopedit.shopname.value;
                  seller.membership_id =
                      int.parse(shopedit.membership_id.value);
                  seller.city_province_id =
                      int.parse(shopedit.city_province_id.value);
                  seller.district_id = int.parse(shopedit.district_id.value);
                  seller.address = shopedit.address.value;
                  updateShop = Get.put(UpdateShop(seller));
                });

                print(seller.name);
                print(seller.city_province_id);

                updateShop.updateShop().then((response) => {
                      if (!response.status)
                        {
                          _showMyDialog(context, response.msg),
                        }
                      else
                        {
                          print(response.data),
                        }
                    });
              },
              icon: Icon(
                Icons.check,
                color: Colors.green,
              ))
        ],
      ),
      body: Card(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Shop Name",
                ),
                initialValue: shopedit.shopname.value,
                onChanged: (text) {
                  shopedit.shopnametxt.text = text;
                },
                //controller: _shopname,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Membership",
                ),
                initialValue: "${shopedit.membership_id}",
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Supplier",
                ),
                initialValue: "${shopedit.supplier_id}",
              ),
              /*TextFormField(
                decoration: InputDecoration(
                  labelText: "City/Province",
                ),
                initialValue: "${shopedit.city_province}",*/
              GetX<SellerController>(
                builder: (controller) {
                  return DropdownButtonFormField<String>(
                    //hint: Text("City/Province"),
                    decoration: InputDecoration(
                      labelText: "City/Province",
                      border: InputBorder.none,
                      //prefixIcon: Icon(Icons.add_location),
                      //hintText: "City/Province",
                      isDense: true, // Added this
                      //contentPadding: EdgeInsets.all(10),
                    ),
                    value: "${seller.city_province_id}",

                    items: sellerController.provinces
                        .map<DropdownMenuItem<String>>((dynamic provinces) {
                      return DropdownMenuItem<String>(
                        child: Text(provinces.default_name),
                        value: "${provinces.id}",
                      );
                    }).toList(),
                    onChanged: (String? val) {
                      setState(() {
                        shopedit.city_provincetxt.text = val!;
                        String pro = val;
                        sellerController.getDistricts(pro);
                        // wrong
                        setState(() {
                          shopedit.districttxt.text = "";
                        });

                        //
                        _districtId = null;
                        //_cityprovince = provinces.where((province)=>"${province.id}"==pro).toList();
                      });
                    },
                  );
                },
              ),
              GetX<SellerController>(builder: (controller) {
                return DropdownButtonFormField<String>(
                  //hint: Text("District"),
                  onChanged: (String? district) {
                    setState(() {
                      _districtId = district!;
                      shopedit.districttxt.text = _districtId!;
                    });
                  },
                  //onSaved: (String? val) {},
                  decoration: InputDecoration(
                    labelText: "District",
                    border: InputBorder.none,
                    /*prefixIcon:
                            Icon(Icons.add_location), */ // hintText: "District",
                    isDense: true, // Added this
                    // contentPadding: EdgeInsets.all(10),
                  ),
                  value: _districtId ?? null, // "${seller.district_id}",
                  items: controller.districts
                      .map<DropdownMenuItem<String>>((District district) {
                    return DropdownMenuItem<String>(
                      child: Text(district.default_name),
                      value: district.id.toString(),
                    );
                  }).toList(),
                );
              }),

              /* TextFormField(
                decoration: InputDecoration(
                  labelText: "District",
                ),
                initialValue: "${shopedit.district}",
              ),*/
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Address",
                ),
                initialValue: "${shopedit.address}",
              ),
              SizedBox(height: 10),
              Text("Logo"),
              Center(
                child: Image(
                  image: NetworkImage("${shopedit.logo_image}"),
                  fit: BoxFit.fitWidth,
                ),
              ),
              SizedBox(height: 10),
              Text("Cover"),
              Center(
                child: Image(
                  image: NetworkImage("${shopedit.cover_image}"),
                  fit: BoxFit.fitWidth,
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.arrow_forward),
      ),
    );
  }

  Future<void> _showMyDialog(BuildContext context, String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Submit Failed !'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
