import 'dart:convert';

import 'package:kasemall/model/seller_model.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kasemall/shopping/shopping_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShopRepository {


  Future<Seller>? getShopInfo() async {
    String user = '';
    final preferences = await SharedPreferences.getInstance();
     user = preferences.getString('user')!;
    

    return Seller.fromJson(jsonDecode(user)['shop']);
  }
}