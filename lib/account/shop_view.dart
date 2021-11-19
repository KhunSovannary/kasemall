import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kasemall/account/controller/updateshop_controller.dart';
import 'package:kasemall/account/image/image_viewer.dart';
import 'package:kasemall/account/shop_repository.dart';
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
  Seller seller = new Seller();
  late UpdateShop update;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _shopname.text = "";

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
      ),
      body: Card(
        child: FutureBuilder<Seller>(
          future: shopRepository.getShopInfo(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                        decoration: InputDecoration(
                          labelText: "Shop Name",
                          suffix: GestureDetector(
                              onTap: () async {
                                setState(() {
                                  seller = snapshot.data!;
                                  clicked = !clicked;
                    
                                }

                                    //print(_shopname);
                                    /*if(_shopname!=null){
                                      updateShop(snapshot.data!,
                                        name: _shopname.text);*/

                                    /*(updateShop(snapshot.data!,
                                        name: _shopname.text);*/
                                    );
                              },
                              child: Icon(Icons.edit,
                                  color:
                                      clicked ? Colors.green : Colors.black)),
                        ),
                        /* onSaved: (text) {
                            _shopname.text = text!;
                          },*/
                        //initialValue: snapshot.data!.name,
                        controller: TextEditingController(
                            text: _shopname.text != ""
                                ? seller.name
                                : "${snapshot.data!.id!}"),
                        onChanged: (text) {
                          seller.name = text;
                          print(seller.name);
                        },
                        //controller: _shopname,
                        readOnly: clicked ? false : true),
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
      floatingActionButton: FloatingActionButton(
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
