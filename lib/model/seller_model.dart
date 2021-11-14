import 'dart:async';
import 'dart:convert';
//import 'dart:html';
import 'dart:io' as file;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Seller {
  // final int id;
  final String name;
  final String phone;
  final String membership_id;
  final String city_province_id;
  final String district_id;
  final String supplier_id;
  final String address;
  final file.File logo_image;
  final file.File cover_image;

  Seller({
    required this.name,
    required this.phone,
    required this.membership_id,
    required this.city_province_id,
    required this.district_id,
    required this.supplier_id,
    required this.address,
    required this.logo_image,
    required this.cover_image,
  });

  factory Seller.fromJson(Map<String, dynamic> json) {
    return Seller(
      name: json['name'],
      phone: json['phone'],
      membership_id: json['membership'],
      city_province_id: json['cover_image'],
      district_id: json['district_id'],
      supplier_id: json['supplier_id'],
      address: json['address'],
      logo_image: json['logo_image'],
      cover_image: json['cover_image'],
    );
  }
}

FutureBuilder<Seller> buildFutureBuilder() {
  Future<Seller>? _futureSeller;
  return FutureBuilder<Seller>(
    future: _futureSeller,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Text(snapshot.data!.name);
      } else if (snapshot.hasError) {
        return Text('${snapshot.error}');
      }

      return const CircularProgressIndicator();
    },
  );
}
