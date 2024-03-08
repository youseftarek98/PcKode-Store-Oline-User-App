import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pckode/controller/address/view_controller.dart';
import 'package:pckode/core/class/handlingdataview.dart';
import 'package:pckode/core/constant/routes.dart';
import 'package:pckode/data/model/addressmodel.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    AddressViewController controller = Get.put(AddressViewController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.addressadd);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('65'.tr),
      ),
      body: GetBuilder<AddressViewController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                child: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (_, i) {
                    return CardAddress(
                      addressModel: controller.data[i],
                      onDelete: () {
                        controller.deleteAddress(controller.data[i].addressId!);
                      },
                    );
                  },
                ),
              ))),
    );
  }
}

class CardAddress extends StatelessWidget {
  final AddressModel addressModel;

  final void Function()? onDelete;

  const CardAddress({super.key, required this.addressModel, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: ListTile(
          title: Text("${addressModel.addressName}"),
          subtitle: Text(
              "${addressModel.addressCity} - ${addressModel.addressStreet}"),
          // trailing: IconButton(
          //     onPressed: onDelete, icon: const Icon(Icons.delete_outline)),
        ),
      ),
    );
  }
}
