import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pckode/view/screen/home.dart';
import 'package:pckode/view/screen/notification.dart';
import 'package:pckode/view/screen/offers.dart';
import 'package:pckode/view/screen/settings.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
    const HomePage(),
    const OffersView(),
    const NotificationView(),
    const Settings()
  ];

  List buttonappbar = [
    {'title': 'Home', 'icon': Icons.home},
    {'title': 'Offers', 'icon': Icons.offline_bolt_outlined},
    {'title': 'Notification', 'icon': Icons.notifications_active_outlined},
    {'title': 'Settings', 'icon': Icons.settings},
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
