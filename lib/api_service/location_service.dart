import 'package:flutter/cupertino.dart';
import 'package:geocode/geocode.dart';
import 'package:geocoding/geocoding.dart';
import 'package:kasemall/model/location_model.dart';
import 'package:location/location.dart' as loc;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class LocationService with ChangeNotifier {
  final location = new loc.Location();

  late double lat;
  late double lng;
  late String addressLine;
  late String fullAddress;
  late CameraPosition _camera;
  double get latitude => lat;
  double get longitude => lng;
  String get getAddressLine => addressLine;
  String get getFullAddress => fullAddress;
  LocationModel get getLocation => LocationModel(
      lat: lat,
      lng: lng /*fullAddress: fullAddress, addressLine: addressLine*/);

  getCurrentLocation() async {
    var currentLocation = await location.getLocation();
    var addresses = await placemarkFromCoordinates(
        currentLocation.latitude!, currentLocation.longitude!);
    lat = currentLocation.latitude!;
    lng = currentLocation.longitude!;
    _camera = CameraPosition(
        target: LatLng(currentLocation.latitude!, currentLocation.longitude!));

    var first = addresses.first;

    fullAddress =
        '${first.administrativeArea}, ${first.subLocality}, ${first.subAdministrativeArea},${first.street}, ${first.name},${first.thoroughfare}, ${first.subThoroughfare}';
    /*addressLine = '${first.streetAddress}';
    fullAddress =
        '${first.adminArea},${first.subLocality},${first.subAdminArea},${first.addressLine},${first.featureName},${first.thoroughfare},${first.subThoroughfare}';*/
    notifyListeners();
  }
}
