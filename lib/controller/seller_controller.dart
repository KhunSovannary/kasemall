// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:get/get.dart';
import 'package:kasemall/api_service/api_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SellerController extends GetxController {
  var provinces = <Province>[].obs;
  var districts = <District>[].obs;
  var isLoadDistrict = false.obs;

  @override
  void onInit() {
    // called immediately after the widget is allocated memory
    // fetchApi();
    getCities();
    super.onInit();
  }

  @override
  void onReady() {
    // called after the widget is rendered on screen
    // showIntroDialog();
    super.onReady();
  }

  @override
  void onClose() {
    // called just before the Controller is deleted from memory
    // closeStream();
    super.onClose();
  }

  bool get isGetDistrict => isLoadDistrict.value;

   getCities() async {
    final sharePreference = await SharedPreferences.getInstance();
    final token = sharePreference.get('token');
    print('city');
    try {
      String urlApi = 'https://kasefarm1.kasegro.com/api/provinces/1';
      var apiResult = await http.get(Uri.parse(urlApi), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

      if (apiResult.statusCode == 200) {
        final response = json.decode(apiResult.body);
        provinces.value = response['data']['provinces']
            .map<Province>((json) => Province.createData(json))
            .toList();
        isLoadDistrict.value = true;
      } else {
        print('error from province ${apiResult.body}');
      }
    } catch (e) {
      print(e);
    }
  }

   getDistricts(String districtId) async {
    final sharePreference = await SharedPreferences.getInstance();
    final token = sharePreference.get('token');
    districts.value = [];
    print('district');

    try {
      String URLapi = 'https://kasefarm1.kasegro.com/api/districts/$districtId';
      var apiResult = await http.get(Uri.parse(URLapi), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

      if (apiResult.statusCode == 200) {
        final response = json.decode(apiResult.body);
        districts.value = response['data']['Districts']
            .map<District>((json) => District.createData(json))
            .toList();
      } else
        print(apiResult.body);
    } catch (e) {
      print(e);
    }
  }
}
