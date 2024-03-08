import 'dart:async';
import 'package:pckode/core/class/status_request.dart';

import 'package:pckode/core/functions/getdecodepolyline.dart';
import 'package:pckode/core/services/services.dart';
import 'package:pckode/data/model/ordersmodel.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TrackingController extends GetxController{


Set<Polyline> polylineSet = {} ;

  GoogleMapController? gmc;

  MyServices myServices = Get.find();

  CameraPosition? cameraPosition;

  List<Marker> markers = [];


  StatusRequest statusRequest = StatusRequest.success;

  late OrdersModel ordersModel;

  

  double? destlat;
  double? destlong;

 double? currentlat;
 double? currentlong ;





initialData(){
   cameraPosition = CameraPosition(
        target: LatLng(double.parse(ordersModel.addressLat!),
            double.parse(ordersModel.addressLong!)),
        zoom: 12.4746,
      );

     markers.add(Marker(
          markerId:  MarkerId('current'),
          position: LatLng(double.parse(ordersModel.addressLat!),
              double.parse(ordersModel.addressLong!))));

    // markers.removeWhere((element) => element.markerId.value == 'current') ;
    //  markers.add(Marker(
    //       markerId:  MarkerId('current'),
    //       position: LatLng(position.altitude,position.longitude)));

}


getLocationDelivery(){
  FirebaseFirestore.instance.collection('delivery').doc(ordersModel.ordersId).snapshots().listen((event) {
    if(event.exists){
      destlat = event.get('lat');
      destlong = event.get('long') ;
      updateMarckerDelivery(destlat! , destlong!) ;
    }
  }) ;
}

updateMarckerDelivery(double newlat , double newlong){
  markers.removeWhere((element) => element.markerId.value == 'dest') ;
     markers.add(Marker(
          markerId:  MarkerId('dest'),
          position: LatLng(newlat,newlong)));
}

initPolyLine()async{
  destlat = double.parse(ordersModel.addressLat!) ;
  destlong = double.parse(ordersModel.addressLong!) ;
  Future.delayed(Duration(seconds: 1)) ;
  polylineSet = await getPolyline(currentlat , currentlong , destlat , destlong) ;
  update() ;
}

@override
  void onInit() {
    ordersModel = Get.arguments["ordersmodel"];
    getLocationDelivery() ;
 initialData() ;
  // initPolyLine() ;
    super.onInit();
  }

  @override
  void dispose() {
    gmc!.dispose();
    super.dispose();
  }

}