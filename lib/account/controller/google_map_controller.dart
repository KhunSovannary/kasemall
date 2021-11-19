import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kasemall/api_service/location_service.dart';
import 'package:kasemall/model/location_model.dart';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';

class GGMap extends StatefulWidget {
  @override
  _GGMapState createState() => _GGMapState();
}

class _GGMapState extends State<GGMap> {
  GoogleMapController? mapController;
  late Position _currentPosition;
  late String _currentAddress;
  final geolocator = new Geolocator();
  late LocationModel location = new LocationModel();
  late final LocationService locationService = Get.put(LocationService());
  late String searchAddr;
  late StreamSubscription<Position> positionStream;
  @override
  void initState() {
    super.initState();
    locationService.getCurrentLocation().whenComplete(() {
      setState(() {
        location = locationService.getLocation;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        GoogleMap(
          initialCameraPosition: CameraPosition(
              target: LatLng(location.lat!, location.lng!), zoom: 10.0),
          onMapCreated: onMapCreated,
          mapType: MapType.normal,
        ),
        Positioned(
          top: 30.0,
          right: 15.0,
          left: 15.0,
          child: Container(
              height: 50.0,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Enter Address',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                    suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: searchandNavigate,
                        iconSize: 30.0)),
                onChanged: (val) {
                  setState(() {
                    searchAddr = val;
                  });
                },
              )),
        )
      ]),
    );
  }

  searchandNavigate() {
    positionStream = Geolocator.getPositionStream(forceAndroidLocationManager: true).listen((Position position) {
      mapController!.animateCamera(
        CameraUpdate.newCameraPosition(
           CameraPosition(
            target: LatLng(position.latitude, position.longitude), zoom: 50.0))
      );
      //  print(position == null ? 'Unknown' : position.latitude.toString() + ', ' + position.longitude.toString());
    });
  }

  void onMapCreated(controller) {
    setState(() {
      mapController = controller;
    });
  }
}
