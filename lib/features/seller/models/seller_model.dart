class SellerModel {
  SellerModel({
    this.shopCategoryId,
    this.supplierId,
    this.name,
    this.about,
    this.logoImage,
    this.coverImage,
    this.phone,
    this.countryId,
    this.cityProvinceId,
    this.districtId,
    this.address,
    this.lat,
    this.lng,
    this.membershipId,
  });

  int? shopCategoryId;
  int? userId;
  int? supplierId;
  String? name;
  String? about;
  String? logoImage;
  String? coverImage;
  String? phone;
  int? countryId;
  int? cityProvinceId;
  int? districtId;
  String? address;
  String? lat;
  String? lng;
  int? membershipId;
}
