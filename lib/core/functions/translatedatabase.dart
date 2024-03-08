import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pckode/core/services/services.dart';

translatedatabase(columnar, columnen) {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString("lang") == "ar") {
    return columnar;
  } else {
    return columnen;
  }
}
