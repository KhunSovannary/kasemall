// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:get/get.dart';
import 'package:kasemall/api_service/api_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SellerController extends GetxController {
  var provinces = <Province>[].obs;
  var districts = <District>[].obs;

  @override
  void onInit() {
    // called immediately after the widget is allocated memory
    // fetchApi();
    getDistrict();
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

  String token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImY5MWUwNzJjOTEwNTdjNjk4NjQ5MmE2NDUxNzc0MzZkYjk4Nzg5NmY1NGEwYzFhOTkwYzk0NDdkNTlmZDQwNjE0MWRkOTMwMWYyMzQ3NzExIn0.eyJhdWQiOiIxIiwianRpIjoiZjkxZTA3MmM5MTA1N2M2OTg2NDkyYTY0NTE3NzQzNmRiOTg3ODk2ZjU0YTBjMWE5OTBjOTQ0N2Q1OWZkNDA2MTQxZGQ5MzAxZjIzNDc3MTEiLCJpYXQiOjE2MzY4NjAwNDQsIm5iZiI6MTYzNjg2MDA0NCwiZXhwIjoxNjY4Mzk2MDQ0LCJzdWIiOiI5NCIsInNjb3BlcyI6W119.Iywqepalvbi_JS1C_dNNMAJPXEqvwfrwGDMSTR70FuiXUdKRDztcYmuS-8I7w98K7hAc92biKIB-sIKyAPFUKl38jQPjHGf6KQNXPoJW1HsjcGXNhCSSU_fq6r9n6JvvZjFvbkY_S9yfQVESb6LScVki15pSbQzzUogPz4QfM_iBpCkYzye6xcdwvyWj-eYYI7sSnbVM7zZURKBCfnH9vuQqmXewW_m2VEzLa9di_Cgcb9bmKeFXW1g2972bVlNxHDwwR5uuzFuMFnHExlRYd3xdoBJ1EYW9Wm3QjYbHfDjo5m8JVE81yFg-3AKp8qlDZdZLSrE6eTCIMKl9hbn2pCJeGWAAoUh4OgE5w1a9wlsETQR_MKnzl-pOKlt6xcnwF2xCgM0NKHzW0g_fs5XTgc7wSGiRcgcDDqvkUMm2TEnG9lsKLsn_HDd2OaEtUiJChTgWG4oXK0cDRPT0H0J9hX3jQ61ry8FcVjsrlNalMtfSDLpPROsNY3SleW4PvUtqqKjfXBXL6x6szc5Mm2RnTHbSsxqn2RKhmXDJc1deC8I3W19uHOVQM8L8X5Ox_ROykMrt4DsVD8ADKt2lQeAEOFe-ByS2PA27a8yo4JkNk77fhpbrIav3aEJC2OmslwfbqpF0PUzBhN3kCx8CAMyGo5Wb_Rv2QptnTL2Krn2312g';

  void getDistrict() async {
    // final sharePreference = await SharedPreferences.getInstance();
    // final token = sharePreference.get('token');

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
      } else {
        print('error from province ${apiResult.body}');
      }
    } catch (e) {
      print(e);
    }
  }

  void getDistricts(String districtId) async {
    // final sharePreference = await SharedPreferences.getInstance();
    // final token = sharePreference.get('token');

    String URLapi = 'https://kasefarm1.kasegro.com/api/districts/$districtId';
    var apiResult = await http.get(Uri.parse(URLapi), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (apiResult.statusCode == 200) {
      final response = json.decode(apiResult.body);
      print(response);
      districts.value = response['data']['Districts']
          .map<District>((json) => District.createData(json))
          .toList();
    } else
      print(apiResult.body);
  }
}
