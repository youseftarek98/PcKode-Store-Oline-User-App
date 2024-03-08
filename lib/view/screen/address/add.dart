import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pckode/controller/address/add_controller.dart';
import 'package:pckode/core/class/handlingdataview.dart';
import 'package:pckode/core/constant/color.dart';


class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    AddAddressController controllerpage = Get.put(AddAddressController());
    return Scaffold(

        appBar: AppBar(
          title:  Text('83'.tr),
        ),
        body: Container(
          child: GetBuilder<AddAddressController>(
            builder: ((controllerpage) =>
                HandlingDataView(
                    statusRequest: controllerpage.statusRequest,
                    widget: Column(
                      children: [
                        if (controllerpage.cameraPosition != null)
                          Expanded(
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  GoogleMap(
                                    mapType: MapType.normal,
                                    markers: controllerpage.markers.toSet(),
                                    onTap: (latlong) {
                                      controllerpage.addMarkers(latlong);
                                    },
                                    initialCameraPosition: controllerpage
                                        .cameraPosition!,
                                    onMapCreated: (
                                        GoogleMapController controllermap) {
                                      controllerpage.completercontroller!
                                          .complete(controllermap);
                                    },
                                  ),
                                  Positioned(
                                      bottom: 10,
                                      child: Container(
                                          child: MaterialButton(
                                            minWidth: 200,
                                            onPressed: () {
                                              controllerpage
                                                  .goToPageAddDetailsAddress();
                                            },
                                            color: AppColor.primaryColr,
                                            textColor: Colors.white,
                                            child:  Text("84".tr,
                                              style: const TextStyle(
                                                  fontSize: 18),),)))
                                ],
                              ))
                      ],
                    ))),
          ),
        ));
  }
}
