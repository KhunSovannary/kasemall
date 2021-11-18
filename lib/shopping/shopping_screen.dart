import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kasemall/account/profile_screen.dart';
import 'package:kasemall/account/seller/seller_screen.dart';
import 'package:kasemall/account/shop_view.dart';
import 'package:kasemall/homepage/home_screen.dart';
import 'package:kasemall/login/login_screen.dart';
import 'package:kasemall/model/product_model.dart';
import 'package:kasemall/model/seller_model.dart' as sell;
import 'package:shared_preferences/shared_preferences.dart';

class Shop extends StatefulWidget {
  //const Shop(key) : super(key: key);

  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  sell.Seller seller = new sell.Seller();
  List<Product>? products = [
    Product(1, "Juice", 2.5),
    Product(2, "Grape", 3.4)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[700],
          title: Text(
            "KaseMall",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart_rounded),
                iconSize: 30.0),
            //IconButton(onPressed: (){}, icon: const Icon(Icons.share)),
            //IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        drawer: Drawer(
          child: Container(
            color: Colors.white,
            child: ListView(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  child: Image(
                      image: AssetImage("lib/assets/profile_default.png")),
                ),
                SizedBox(
                  height: 50,
                ),
                Text("Hello"),
                SizedBox(height: 50),
                Text("Hi"),
                SizedBox(height: 50),
                InkWell(
                    child: Text("Account Setting"),
                    onTap: () async {
                      
                      final preferences = await SharedPreferences.getInstance();
                      String? shop = preferences.getString('user');
                      
                      // print(seller.name);
                      if (shop != "") {
                        Get.to(() => myShop());
                      } else {
                        Get.defaultDialog(
                          title: "Do you want to be a seller?",
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              InkWell(
                                child: Text("Yes"),
                                onTap: () {
                                  Get.to(
                                      () => Seller(title: "Become a seller"));
                                },
                              ),
                              SizedBox(width: 50),
                              InkWell(
                                child: Text("No"),
                                onTap: () {
                                  Get.to(() => Profile(
                                      title: "Fill in your information"));
                                },
                              ),
                            ],
                          ),
                        );
                      }
                    }),
                SizedBox(height: 20),
                Row(children: [
                  Icon(Icons.logout),
                  InkWell(
                    child: Text("Log Out"),
                    onTap: () {
                      logoutUser();
                    },
                  )
                ]),
                InkWell(
                    child: Text("Back to HomePage"),
                    onTap: () {
                      Get.to(() => MyHomePage());
                    }),
              ],
            ),
          ),
        ),
        body: Container(
          child: ListView(children: [
            Card(
              child: Column(children: [
                SizedBox(height: 10),
                //SingleChildScrollView(
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Search",
                      suffixIcon: Container(
                          color: Colors.green,
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ))),
                ),

                SizedBox(height: 12),
                SizedBox(
                  height: 150.0,
                  width: double.infinity,
                  child: CarouselSlider(
                    options: CarouselOptions(),
                    items: <Widget>[
                      Image(
                          image: AssetImage(
                            "lib/assets/image1.jpg",
                          ),
                          fit: BoxFit.cover),
                      Image(
                          image: AssetImage(
                            "lib/assets/image2.jpg",
                          ),
                          fit: BoxFit.cover),
                      Image(
                          image: AssetImage(
                            "lib/assets/image3.jpg",
                          ),
                          fit: BoxFit.cover),
                      /*Image.asset("lib/assets/image2.jpg",
                      fit: BoxFit.cover,),
                      Image.asset("/lib/assets/image3.jpg",
                      fit: BoxFit.cover,),*/
                    ],
                  ),
                ),
              ]),
            ),
            Card(
                color: Colors.green[100],
                child: CarouselSlider(
                  options: CarouselOptions(),
                  items: products!
                      .map(
                        (Product p) => Column(children: [
                          Text("Product:${p.id!}"),
                          SizedBox(height: 2),
                          Text(p.name!),
                          SizedBox(height: 2),
                          Text("${p.price!}"),
                          SizedBox(height: 2),
                        ]),
                      )
                      .toList(),
                )),
          ]),
        ));
  }

  void logoutUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('phone');
    Get.to(() => Login());
  }
}
