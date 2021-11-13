import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Province {
  final int id;
  final String name;
  final String default_name;

  Province({
    required this.id,
    required this.name,
    required this.default_name,
  });

  factory Province.createData(Map<String, dynamic> json) {
    return Province(
      id: json['id'],
      name: json['name'],
      default_name: json['default_name'],
    );
  }
}
  /*static Future<List<Province>> connectToAPI() async {
      final sharePreference = await SharedPreferences.getInstance();
      final token = sharePreference.get('token');

      // try
  try{
      String URLapi = 'https://kasefarm1.kasegro.com/api/provinces/1';
      var apiResult = await http.get(Uri.parse(URLapi), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

      print(apiResult.body);
      print(apiResult.statusCode);
      if (apiResult.body != null) {
        if (apiResult.statusCode == 200) {
          var jsonObject = json.decode(apiResult.body);
          var data = (jsonObject as Map<String, dynamic>)['data'];

          final response = json.decode(apiResult.body);
          return response['data']['provinces']
              .map<Province>((json) => Province.createData(json))
              .toList();
        }
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}

class District {
  final int id;
  final String name;
  final String default_name;

  District({
    required this.id,
    required this.name,
    required this.default_name,
  });

  factory District.createData(Map<String, dynamic> json) {
    return District(
      id: json['id'],
      name: json['name'],
      default_name: json['default_name'],
    );
  }
  static Future<List<District>> connectToAPI(String p) async {
    final sharePreference = await SharedPreferences.getInstance();
    final token = sharePreference.get('token');

    // try

    String URLapi = 'https://kasefarm1.kasegro.com/api/districts/$p';
    var apiResult = await http.get(Uri.parse(URLapi), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    print(apiResult.body);
    print(apiResult.statusCode);
    if (apiResult.statusCode == 200) {
      var jsonObject = json.decode(apiResult.body);
      var data = (jsonObject as Map<String, dynamic>)['data'];

      final response = json.decode(apiResult.body);
      return response?response['data']['Districts']
          .map<District>((json) => District.createData(json))
          .toList():[];
    } else
      print(apiResult.body);
  }
}
  /*static Future<List<Provinces>> getData() async {
    String URLapi = 'https://kasefarm1.kasegro.com/api/provinces/1';
    var apiResult = await http.get(Uri.parse(URLapi), headers: {
      HttpHeaders.authorizationHeader:
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjU2N2Y3NDIyY2ZmNzIwZWYxZmEyYmIxZTg3NDU3MWU2YzlhNTY0ODMzNzM1MTI2MDQ4NDk3ZWJhYWViYTdjM2ZkODUyN2M3N2FlYzZhYTFiIn0.eyJhdWQiOiIxIiwianRpIjoiNTY3Zjc0MjJjZmY3MjBlZjFmYTJiYjFlODc0NTcxZTZjOWE1NjQ4MzM3MzUxMjYwNDg0OTdlYmFhZWJhN2MzZmQ4NTI3Yzc3YWVjNmFhMWIiLCJpYXQiOjE2MzYyMTk3NDMsIm5iZiI6MTYzNjIxOTc0MywiZXhwIjoxNjY3NzU1NzQzLCJzdWIiOiI5NCIsInNjb3BlcyI6W119.U57_nHk7fcQAJ7uU4622Al2vSBtFMywrJCCSWScxosrHHKzMLjMALPuD0H4ExggZwIjUC1wlSCxJ1rLYSZrsjLumHYIi4_pEEuO1kpygE2UjO0mNwXOvlbGVOxyzxKfi4-ri4ayyPSfQkvC1dYjw5uQPld6dOOpRc2IhD6ezXZb_lj3ORi2I3gJ04r4NZ-U8dEJCugr6aaY6_ZgXDtRlP7tBYPRodjziLSM7h6R-B-aOLVuL2WhAbR7XYPPZr4xW1DvW-aKpn3J-VSsZH-hAp1tzy5IsgeC3ky_Yzuc0UljaWcCSp_PirNVtY-oWcmFsWGXYJmJQ6iSGeBgcsg5CzYLrOjbCvBAjh4QQXHmO6I6I821D7LJ33Om2ntFOuBEa_HvaLPPrn2QaqLaXu7o4nyyFD_B-mW0R0A8ncnog1oQl-Gj6DUI1641COBi8_oPkCRq4_qImXXAlW-eiSYrCIRXmbopv7lC_zv6cz8NuriKZ04bMKtdl1EnMhreyV_80OE5YjIvR4dY5LIRj0u72QHpmc9R2YbrNVypR8fNg7IpXNLfQZJgayrcNIbwAYgTyn_A1FQ8rudT4sRB_nMdKXZpAcZFm1VciMYwYbvOGqfbQnNHYAGMFHrGVJo1t14t51ORjfJmADYzKlqhmi3VLqQdY3RYQjKH0epxHewHFySA"
    });

    if (apiResult.statusCode == 200) {
      print(apiResult.body);
      var jsonObject = json.decode(apiResult.body);
      List<Map<String,dynamic>> data = (jsonObject as Map<String, dynamic>)['data'];

      List<Provinces> listData = [];
      for (int i = 0; i < data.length; i++) {
        listData.add(Provinces.createData(data[i]));
      }
    }
    else
      print(apiResult.body);
  }*/
*/
