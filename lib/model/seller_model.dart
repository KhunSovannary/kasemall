import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Seller> createAlbum(String title,String name,
  String phone,
  String membership_id,
  String city_province_id,
  String district_id,
  String supplier_id,
  String address,
  File logo_image,
  File cover_image) async {
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Seller.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

class Seller{
 // final int id;
  final String name;
  final String phone;
  final String membership_id;
  final String city_province_id;
  final String district_id;
  final String supplier_id;
  final String address;
  final File logo_image;
  final File cover_image;

  Seller({ this.name, 
          this.phone, 
          this.membership_id,
          this.city_province_id,
          this.district_id,
          this.supplier_id,
          this.address,
          this.logo_image,
          this.cover_image,
          });

  factory Seller.fromJson(Map<String, dynamic> json) {
    return Seller(
      name: json['name'],
      phone: json['phone'],
      membership_id:json['membership'],
      city_province_id:json['cover_image'],
      district_id: json['district_id'],
      supplier_id: json['supplier_id'],
      address: json['address'],
      logo_image: json['logo_image'],
      cover_image: json['cover_image'],

    );
  }
}


  FutureBuilder<Seller> buildFutureBuilder() {
    Future<Seller> _futureSeller;
    return FutureBuilder<Seller>(
      future: _futureSeller,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data.name);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
