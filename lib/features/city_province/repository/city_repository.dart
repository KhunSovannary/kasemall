import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kasemall/api_service/api_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CityRepository {
  const CityRepository._();

  static Future<List<Province>> getProvince() async {
    final sharePreference = await SharedPreferences.getInstance();
    final token = sharePreference.get('token');
    try {
      String urlApi = 'https://kasefarm1.kasegro.com/api/provinces/1';
      var apiResult = await http.get(Uri.parse(urlApi), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

      if (apiResult.statusCode == 200) {
        final response = json.decode(apiResult.body);
        return response['data']['provinces']
            .map<Province>((json) => Province.createData(json))
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
