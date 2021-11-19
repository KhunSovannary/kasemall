import 'package:flutter/cupertino.dart';
import 'package:geocode/geocode.dart';
import 'package:kasemall/model/location_model.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationService with ChangeNotifier {
  final location = new Location();

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
      lat: lat, lng: lng/*fullAddress: fullAddress, addressLine: addressLine*/);

  getCurrentLocation() async {
    var currentLocation = await location.getLocation();
    lat = currentLocation.latitude!;
    lng = currentLocation.longitude!;
    _camera = CameraPosition(
        target: LatLng(currentLocation.latitude!, currentLocation.longitude!));
    // var first = addresses;
 
    /*addressLine = '${first.streetAddress}';
    fullAddress =
        '${first.adminArea},${first.subLocality},${first.subAdminArea},${first.addressLine},${first.featureName},${first.thoroughfare},${first.subThoroughfare}';*/
    notifyListeners();
  }
}
