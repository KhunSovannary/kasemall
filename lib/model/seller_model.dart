import 'dart:async';
import 'dart:convert';
//import 'dart:html';
import 'dart:io' as file;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Seller {
  int? status;
  int? id;
  String? name;
  String? phone;
  int? membership_id;
  int? city_province_id;
  String? city;
  int? district_id;
  String? district;
  int? supplier_id;
  String? address;
  String? logo_image;
  String? cover_image;

  Seller({
    this.status,
    this.id,
    this.name,
    this.phone,
    this.membership_id,
    this.city_province_id,
    this.city,
    this.district_id,
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
      status: json['status'],
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      membership_id: json['membership_id'],
      city: json['city'],
      city_province_id: json['city_province_id'],
      district: json['district'],
      district_id: json['district_id'],
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
