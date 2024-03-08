import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pckode/core/class/status_request.dart';
import 'package:pckode/core/constant/routes.dart';

class AddAddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;

  Completer<GoogleMapController>? completercontroller;
  List<Marker> markers = [];

  double? lat;

  double? long;

  addMarkers(LatLng latLang) {
    markers.clear();
    markers.add(Marker(markerId: MarkerId("1"), position: latLang));
    lat = latLang.latitude;
    long = latLang.longitude;
    update();
  }

  goToPageAddDetailsAddress() {
    Get.toNamed(AppRoute.addressadddetails,
        arguments: {"lat": lat.toString(), "long": long.toString()});
  }

  Position? postion;
  CameraPosition? cameraPosition;

  getCurrentlocation() async {
    postion = await Geolocator.getCurrentPosition();
    cameraPosition = CameraPosition(
      target: LatLng(postion!.latitude, postion!.longitude),
      zoom: 14.4746,
    );
    addMarkers(LatLng(postion!.latitude, postion!.longitude));
    statusRequest = StatusRequest.none;
    update();
  }

  @override
  void onInit() {
    getCurrentlocation();
    completercontroller = Completer<GoogleMapController>();
    super.onInit();
  }
}
