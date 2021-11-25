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
}
