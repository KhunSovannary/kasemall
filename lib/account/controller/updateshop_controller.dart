import 'dart:io' as file;
//import 'dart:html';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kasemall/model/response_model.dart';
import 'package:kasemall/model/seller_model.dart';
//import 'package:kasemall/model/seller_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateShop extends GetxController {
  var name = "".obs;
  var phone = "".obs;
  var membership_id = "".obs;
  var city_province_id = "".obs;
  var district_id = "".obs;
  var supplier_id = "".obs;
  var address = "".obs;
  var logo_image = "".obs;
  var cover_image = "".obs;
  var status = "".obs;
  var id = "".obs;
  Seller seller;
  UpdateShop(this.seller);
  @override
  void onInit() {
    super.onInit();
    updateShop();
  }

  Future<ResponseModel> updateShop() async {
    final sharePreference = await SharedPreferences.getInstance();
    final token = sharePreference.get('token');
    name.value = (seller.name!);
    phone.value = (seller.phone!);
    membership_id.value = "${(seller.membership_id!)}";
    city_province_id.value = "${(seller.city_province_id!)}";
    district_id.value = "${(seller.district_id!)}";
    supplier_id.value = "${(seller.supplier_id!)}";
    address.value = (seller.address!);
    logo_image.value = (seller.logo_image!);
    cover_image.value = (seller.cover_image!);
    status.value = "${(seller.status!)}";
    id.value = "${(seller.id!)}";

    try {
      var request = http.MultipartRequest(
          "POST",
          Uri.parse(
              'https://kasefarm1.kasegro.com/api/shops/update/${id.value}'));
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      request.headers.addAll(headers);
      request.fields['status'] = status.value;
      request.fields['shop_id'] = id.value;
      request.fields['name'] = "Little";
      request.fields['phone'] = phone.value;
      request.fields['membership_id'] = membership_id.value;
      request.fields['country_id'] = '1';
      request.fields['city_province_id'] = "${city_province_id.value}";
      request.fields['lat'] = "1";
      request.fields['lng'] = "1";
      request.fields['shop_category_id'] = "1";
      request.fields['district_id'] = "${district_id.value}";
      request.fields['supplier_id'] = "${supplier_id.value}";
      request.fields['address'] = address.value;

      //var shopLogo =
      //await http.MultipartFile.fromString("logo_image", logo_image.value);
      //var shopCover =
      // await http.MultipartFile.fromString("cover_image", cover_image.value);
      /*body: jsonEncode(<String, dynamiullc>{
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
      // request.files.add(shopLogo);
      //request.files.add(shopCover);
      final req = await request.send();
      final response = await req.stream.bytesToString();
      print(response);
      return ResponseModel.fromJson(jsonDecode(response), [], req.statusCode);
    } catch (e) {
      print('Error:$e');

      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw ("Failed to update shop");
    }
  }
}
