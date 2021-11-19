import "package:flutter/cupertino.dart";

class LocationModel {
  LocationModel(
      { this.lat,
        this.lng/*required this.fullAddress, required this.addressLine}*/});
  late final double? lat;
  late final double? lng;
 /* final String fullAddress;
  final String addressLine;*/
}
