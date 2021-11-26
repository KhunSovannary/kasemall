import 'dart:io';

class ShopModel {
  String? name;
  String? phone;
  String? membership_id;
  String? city_province_id;
  String? district_id;
  String? supplier_id;
  String? address;
  File? logo_image;
  File? cover_image;

  ShopModel({
    this.name,
    this.phone,
    this.membership_id,
    this.city_province_id,
    this.district_id,
    this.supplier_id,
    this.address,
    this.logo_image,
    this.cover_image,
  });

  factory ShopModel.fromJson(Map<String, dynamic> json) => ShopModel(
      name: json['name'],
      phone: json['phone'],
      membership_id: json['membership_id'],
      city_province_id: json['city_province_id'],
      district_id: json['district_id'],
      supplier_id: json['supplier_id'],
      address: json['address'],
      logo_image: json['logo_image'],
      cover_image: json['cover_image']);
}
