import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pckode/controller/address/adddetails_controller.dart';
import 'package:pckode/core/class/handlingdataview.dart';
import 'package:pckode/core/shared/custombuttom.dart';
import 'package:pckode/view/widget/auth/custom_text_form_auth.dart';


class AddressAddDetails extends StatelessWidget {
  const AddressAddDetails({super.key});

  @override
  Widget build(BuildContext context) {
    AddAddressDetailsController controller = Get.put(
        AddAddressDetailsController());
    return Scaffold(

        appBar: AppBar(
          title: Text('82'.tr),
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: GetBuilder<AddAddressDetailsController>(
              builder: (controller) =>
                  HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: ListView(
                        children: [
                          CustomTextFormAuth(
                              hinttext: '57'.tr,
                              labeltext: '57'.tr,
                              iconData: Icons.location_city,
                              mycontroller: controller.city,
                              valid: (val) {},
                              isNumber: false),


                          CustomTextFormAuth(
                              hinttext: '58'.tr,
                              labeltext: '58'.tr,
                              iconData: Icons.streetview_outlined,
                              mycontroller: controller.street,
                              valid: (val) {},
                              isNumber: false),


                          CustomTextFormAuth(
                              hinttext: '59'.tr,
                              labeltext: '59'.tr,
                              iconData: Icons.near_me,
                              mycontroller: controller.name,
                              valid: (val) {},
                              isNumber: false),

                          CustomButtom(text: '81'.tr, onPressed: () {
                            controller.addAddress();
                          },)
                        ],
                      ))),
        )
    );
  }
}
