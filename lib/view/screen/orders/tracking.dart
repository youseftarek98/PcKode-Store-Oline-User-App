
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pckode/controller/orders/tracking_controller.dart';
import 'package:pckode/core/class/handlingdataview.dart';


class OrdersTracking extends StatelessWidget {
  const OrdersTracking({super.key});

  @override
  Widget build(BuildContext context) {
    TrackingController controller = Get.put(TrackingController());
    return Scaffold(
      appBar: AppBar(
        title:  Text('71'.tr),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GetBuilder<TrackingController>(
            builder: ((controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget:  Container(
                  child:  Column(
                  children: [
                       Expanded(
                         child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: GoogleMap(
                              polylines: controller.polylineSet,
                              mapType: MapType.normal,
                              markers: controller.markers.toSet(),
                              initialCameraPosition: controller.cameraPosition!,
                              onMapCreated: (GoogleMapController controllermap) {
                                controller.gmc = controllermap;
                              },
                            ),
                          ),
                       ),
                     
                  ],
                ),
                )))),
      ),
    );
  }
}
