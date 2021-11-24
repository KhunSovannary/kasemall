import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kasemall/account/controller/updateshop_controller.dart';
//import 'package:kasemall/account/image/image_viewer.dart';
import 'package:kasemall/account/shop/shop_edit_screen.dart';
import 'package:kasemall/account/shop/shop_repository.dart';
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
  late Seller seller;
  //late Seller newSeller;
  late UpdateShop update;
  late var newSeller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
                //seller = newSeller;
              });
              
            },
            icon: Icon(Icons.edit),
            color: Colors.green,
          )
        ],
      ),
      body: Card(
        child: FutureBuilder<Seller>(
          future: shopRepository.getShopInfo(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              seller = snapshot.data!;
              return SingleChildScrollView(
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
                            text:  seller.name??"${snapshot.data!.name!}"),

                        //controller: _shopname,
                        readOnly: true),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Membership",
                      ),
                      initialValue: "${snapshot.data!.membership_id}",
                      readOnly: true,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Supplier",
                      ),
                      initialValue: "${snapshot.data!.supplier_id}",
                      readOnly: true,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "City/Province",
                      ),
                      initialValue: snapshot.data!.city,
                      readOnly: true,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "District",
                      ),
                      initialValue: snapshot.data!.district,
                      readOnly: true,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Address",
                      ),
                      initialValue: "${snapshot.data!.address}",
                      readOnly: true,
                    ),
                    SizedBox(height: 10),
                    Text("Logo"),
                    Center(
                      child: Image(
                        image: NetworkImage((snapshot.data!.logo_image)!),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("Cover"),
                    Center(
                      child: Image(
                        image: NetworkImage((snapshot.data!.cover_image)!),
                        fit: BoxFit.fitWidth,
                      ),
                    )
                  ],
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
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
