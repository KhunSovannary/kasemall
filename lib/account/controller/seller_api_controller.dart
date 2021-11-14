import 'dart:io' as file;
//import 'dart:html';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kasemall/model/response_model.dart';
import 'package:kasemall/model/seller_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<ResponseModel> openShop(
    String name,
    String phone,
    String membership_id,
    String city_province_id,
    String district_id,
    String supplier_id,
    String address,
    file.File logo_image,
    file.File cover_image) async {
  final sharePreference = await SharedPreferences.getInstance();
  final token = sharePreference.get('token');
  try {
    final response = await http.post(
      Uri.parse('https://kasefarm1.kasegro.com/api/open-shop'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
        'name': name,
        'phone': phone,
        'merbership_id': membership_id,
        'city_province_id': city_province_id,
        'district_id': district_id,
        'supplier_id': supplier_id,
        'address': address,
        'logo_image': logo_image,
        'cover_image': cover_image,
      }),
    );
    return ResponseModel.fromJson(
        jsonDecode(response.body), [], response.statusCode);
  } catch (e) {
    print(e);
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}
