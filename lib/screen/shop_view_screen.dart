import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kasemall/api_service/api_data.dart';
import 'package:kasemall/controller/seller_controller.dart';
import 'package:kasemall/controller/updateshop_controller.dart';
//import 'package:kasemall/account/image/image_viewer.dart';
import 'package:kasemall/screen/shop_edit_screen.dart';
import 'package:kasemall/repository/shop_repository.dart';
import 'package:kasemall/model/seller_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class myShop extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<myShop> {
  final ShopRepository shopRepository = ShopRepository();
  bool clicked = false;
  Color c = Colors.black;
  TextEditingController _shopname = new TextEditingController();
  late Seller seller = new Seller();
  //late Seller newSeller;
  late UpdateShop update;
  late var newSeller;
  SellerController sellerController = Get.put(SellerController());
  late Province p;
  late District d;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sellerController.getCities();
    shopRepository.getShopInfo().whenComplete(() {
      setState(() {
        seller = shopRepository.getseller;
        p = new Province(
            id: seller.city_province_id!,
            name: seller.city!,
            default_name: seller.city!);
        d = new District(
            id: seller.district_id!, default_name: seller.district!);
      });
    });

    /* shopRepository.getShopInfo(seller).whenComplete(() {
      setState(() {
        print(seller);*
      });
    });*/

    //_shopname.text = "";

    // UpdateShop updatecon = UpdateShop(seller:this.seller);
    //_shopname.addListener(_printLatestValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Shop Information",
            style: TextStyle(fontSize: 20, color: Colors.green)),
        leading: BackButton(
          color: Colors.green,
        ),
        actions: [
          IconButton(
            onPressed: () async {
              newSeller = await Get.to(() => myShopEdit(seller: seller));
              setState(() {
                seller = newSeller;
                p.id = seller.city_province_id!;
                p = sellerController.provinces
                    .where((Province province) => province.id == p.id)
                    .first;
                seller.city = p.default_name;
                sellerController.getDistricts("${p.id}}").whenComplete((){
                  setState(() {
                    d.id = seller.district_id!;
                    d = sellerController.districts
                    .where((District district) => district.id == d.id)
                    .first;
                    seller.district = d.default_name;
                  });
                   
                });});
                

                print(newSeller.city);
                print(p.id);
                print(seller.city);
              
            },
            icon: Icon(Icons.edit),
            color: Colors.green,
          )
        ],
      ),
      body: Card(
          child:
              /* FutureBuilder<Seller>(
          future: shopRepository.getShopInfo(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              seller = snapshot.data!;
              return*/
              SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
                decoration: InputDecoration(
                  labelText: "Shop Name",
                ),
                /* onSaved: (text) {
                            _shopname.text = text!;
                          },*/
                //initialValue: snapshot.data!.name,
                controller: TextEditingController(
                  text: seller.name,
                ),

                //controller: _shopname,
                readOnly: true),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Membership",
              ),
              initialValue: "${seller.membership_id}",
              readOnly: true,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Supplier",
              ),
              initialValue: "${seller.supplier_id}",
              readOnly: true,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "City/Province",
              ),
              controller: TextEditingController(text: seller.city,
                ),
              readOnly: true,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "District",
              ),
              controller: TextEditingController(text: seller.district,
              ),
              readOnly: true,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Address",
              ),
              controller: TextEditingController(text: seller.address),
              readOnly: true,
            ),
            SizedBox(height: 10),
            Text("Logo"),
            /*Center(
              child: Image(
                image: NetworkImage((seller.logo_image)!),
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(height: 10),
            Text("Cover"),
            Center(
              child: Image(
                image: NetworkImage((seller.cover_image)!),
                fit: BoxFit.fitWidth,
              ),
            )*/
          ],
        ),
      )),

      /*floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(seller.name);
          setState(() {
            update = Get.put(UpdateShop(seller));
          });
          update.updateShop().then((response) => {
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
        child: Icon(Icons.arrow_forward),
      ),*/
    );
  }
}


