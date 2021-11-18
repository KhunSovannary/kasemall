import 'dart:io' as file;
//import 'dart:html';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kasemall/model/response_model.dart';
import 'package:kasemall/model/seller_model.dart';
//import 'package:kasemall/model/seller_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<ResponseModel> updateShop(Seller seller,
    {var name ,
    var phone,
    var membership_id,
    var city_province_id,
    var district_id ,
    var supplier_id,
    var address ,
    var logo_image,
    var cover_image }) async {
  final sharePreference = await SharedPreferences.getInstance();
  final token = sharePreference.get('token');
  try {
    var request = http.MultipartRequest(
        "PUT", Uri.parse('https://kasefarm1.kasegro.com/api/shops/open-shop'));
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    request.headers.addAll(headers);
    print(seller.address);
    request.fields['name'] = name != null ? name : seller.name!;
    request.fields['phone'] = phone != null? phone : seller.phone!;
    request.fields['membership_id'] =
        membership_id != null ? membership_id : seller.membership_id!;
    request.fields['country_id'] = '1';
    request.fields['city_province_id'] = city_province_id != null
        ? city_province_id
        : "${seller.city_province_id!}";
    request.fields['lat'] = "1";
    request.fields['lng'] = "1";
    request.fields['shop_category_id'] = "1";
    request.fields['district_id'] =
        district_id != null ? district_id : "${seller.district_id!}";
    request.fields['supplier_id'] =
        supplier_id != null ? supplier_id : "${seller.supplier_id!}";
    request.fields['address'] = address != null ? address : seller.address!;
    request.fields['runtimeType'] = "";
    var shopLogo = await http.MultipartFile.fromPath(
        "logo_image", logo_image != null ? logo_image : seller.logo_image!);
    var shopCover = await http.MultipartFile.fromPath("cover_image",
        cover_image != null ? cover_image : seller.cover_image!);
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
    throw("Failed to update shop");
  }
}
