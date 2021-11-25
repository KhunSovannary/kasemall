import 'dart:io' as file;
//import 'dart:html';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kasemall/model/response_model.dart';
import 'package:kasemall/model/shop_model.dart';
//import 'package:kasemall/model/seller_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<ResponseModel> openShop(
  ShopModel shop) async {
  final sharePreference = await SharedPreferences.getInstance();
  final token = sharePreference.get('token');
  try {
    var request = http.MultipartRequest(
        "POST", Uri.parse('https://kasefarm1.kasegro.com/api/shops/open-shop'));
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    request.headers.addAll(headers);
    print(shop.address);
    request.fields['name'] = shop.name!;
    request.fields['phone'] = shop.phone!;
    request.fields['membership_id'] = shop.membership_id!;
    request.fields['country_id'] = '1';
    request.fields['city_province_id'] = shop.city_province_id!;
    request.fields['lat'] = "1";
    request.fields['lng'] = "1";
    request.fields['shop_category_id'] = "1";
    request.fields['district_id'] = shop.district_id!;
    request.fields['supplier_id'] = shop.city_province_id!;
    request.fields['address'] = shop.address!;
    var shopLogo =
        await http.MultipartFile.fromPath("logo_image", shop.logo_image!.path);
    var shopCover =
        await http.MultipartFile.fromPath("cover_image", shop.cover_image!.path);
    /*body: jsonEncode(<String, dynamic>{
        'name': name,
        'phone': phone,
        'merbership_id': membership_id,
        'city_province_id': city_province_id,
        'district_id': district_id,
        'supplier_id': supplier_id,
        'address': address,
        'logo_image': logo_image,
        'cover_image': cover_image,
      }),*/
    request.files.add(shopLogo);
    request.files.add(shopCover);
    final req = await request.send();
    final response = await req.stream.bytesToString();
    print(response);
      return ResponseModel.fromJson(jsonDecode(response), [], req.statusCode);
    
  } catch (e) {
    print('Error:$e');
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to open shop.');
    
  }
}
