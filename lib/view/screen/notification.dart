import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:pckode/controller/notification_controller.dart';
import 'package:pckode/core/class/handlingdataview.dart';
import 'package:pckode/core/constant/color.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationController controller = Get.put(NotificationController());
    return  GetBuilder<NotificationController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding: const EdgeInsets.all(10),
                child: ListView(
                  children: [
                     Center(
                        child: Text(
                      '60'.tr,
                      style: const TextStyle(
                          fontSize: 20,
                          color: AppColor.primaryColr,
                          fontWeight: FontWeight.bold),
                    )),
                    const SizedBox(
                      height: 10,
                    ),
                    ...List.generate(
                        controller.data.length,
                        (index) => Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColor.secoundColor),
                            borderRadius: BorderRadius.circular(9)
                          ),
                        
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListTile(
                                      title: Text(
                                          controller.data[index]
                                              ['notification_title'],
                                          style: const TextStyle(
                                              color: AppColor.primaryColr,
                                              fontWeight: FontWeight.bold)),
                                      subtitle: Text(controller.data[index]
                                          ['notification_body']),
                                    ),
                                  ),

                                  Positioned(
                                      right: 5,
                                      child: Text(
                                          Jiffy(
                                                  controller.data[index]
                                                      ['notification_datetime'],
                                                  'yyyy-MM-dd')
                                              .fromNow(),
                                          style: const TextStyle(
                                              color: AppColor.primaryColr,
                                              fontWeight: FontWeight.bold))),
                                ],
                              ),
                            )
                            ),
                  ],
                ),
              )),
    );
  }
}
