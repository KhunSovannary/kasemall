import 'dart:async';
import 'dart:convert';
//import 'dart:html';
import 'dart:io' as file;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Seller {
  // final int id;
  String? name;
  String? phone;
  String? membership_id;
  String? city;
  String? district;
  int? supplier_id;
  String? address;
  String? logo_image;
  String? cover_image;

  Seller({
    this.name,
    this.phone,
    this.membership_id,
    this.city,
    this.district,
    this.supplier_id,
    this.address,
    this.logo_image,
    this.cover_image,
  });
  /* Seller.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        phone = json['phone'],
        membership_id = json['membership'],
        city_province_id = json['cover_image'],
        district_id = json['district_id'],
        supplier_id = json['supplier_id'],
        address = json['address'],
        logo_image = json['logo_image'],
        cover_image = json['cover_image'];*/

  factory Seller.fromJson(Map<String, dynamic> json) {
    return Seller(
      name: json['name'],
      phone: json['phone'],
      membership_id: json['membership'],
      city: json['city'],
      district: json['district'],
      supplier_id: json['supplier_id'],
      address: json['address'],
      logo_image: json['logo_image'],
      cover_image: json['cover_image'],
    );
  }
  Future<Seller> fetchSeller(json) async {
    return Seller.fromJson(json);
  }
}

