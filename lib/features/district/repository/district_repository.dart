import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kasemall/api_service/api_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DistrictRepository {
  const DistrictRepository._();

  static Future<List<District>> getDistricts(String districtId) async {
    final sharePreference = await SharedPreferences.getInstance();
    final token = sharePreference.get('token');
    try {
      String URLapi = 'https://kasefarm1.kasegro.com/api/districts/$districtId';
      var apiResult = await http.get(Uri.parse(URLapi), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

      if (apiResult.statusCode == 200) {
        final response = json.decode(apiResult.body);
        return response['data']['Districts']
            .map<District>((json) => District.createData(json))
            .toList();
      } else {
        print(apiResult.body);
        return [];
      }
    } catch (e) {
      throw e;
    }
  }
}
