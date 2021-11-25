import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:kasemall/screen/profile_screen.dart';
import 'package:kasemall/screen/openshop_screen.dart';
import 'package:kasemall/screen/shop_view_screen.dart';
import 'package:kasemall/features/seller/views/add_seller_screen.dart';
//import 'dart:html';
import 'screen/home_screen.dart';
import 'screen/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'KaseMall',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
        ),
      ),
      // home: Login(),
      home: MyHomePage(),
    );
  }
}
