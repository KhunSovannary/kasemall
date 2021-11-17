import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kasemall/account/image_viewer.dart';
import 'package:kasemall/account/shop_repository.dart';
import 'package:kasemall/model/seller_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class myShop extends StatelessWidget {
  final ShopRepository shopRepository = ShopRepository();

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
      body:Card(
        child:FutureBuilder<Seller>(
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
                        ),
                        initialValue: snapshot.data!.name,
                        readOnly: true,
                    ),
                    TextFormField(
                        decoration: InputDecoration(
                          labelText: "Membership",
                        ),
                        initialValue: snapshot.data!.membership_id,
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
               SizedBox(height:10),
               Text("Logo"),
               Center(
                 child: Image(
                    image: NetworkImage((snapshot.data!.logo_image)!),              
                    fit: BoxFit.fitWidth,
          ),
               ),
              SizedBox(height:10),
              Text("Cover"),
              Center(
                 child: Image(
                    image: NetworkImage((snapshot.data!.cover_image)!),              
                    fit: BoxFit.fitWidth,
          ),
               )
               ],
            ),);
         }
        return Center(
              child: CircularProgressIndicator());

        },),));
      
    
  }
}
