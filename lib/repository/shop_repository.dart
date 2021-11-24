import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:kasemall/model/seller_model.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kasemall/screen/shopping_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShopRepository extends ChangeNotifier {
  late Seller seller;
  Seller get getseller => seller;

  getShopInfo() async {
    String? user = '';
    final preferences = await SharedPreferences.getInstance();
    user = preferences.getString('user')!;

    seller = Seller.fromJson(jsonDecode(user)['shop']);
  }
}
