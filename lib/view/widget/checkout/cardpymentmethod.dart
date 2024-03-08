import 'package:flutter/material.dart';
import 'package:pckode/core/constant/color.dart';

class CardPymentMethodCheckout extends StatelessWidget {
  final String title;

  final bool isActive;

  const CardPymentMethodCheckout(
      {super.key, required this.title, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: isActive == true ? AppColor.secoundColor : AppColor.thirdColor,
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        title,
        style: TextStyle(
            color: isActive == true ? Colors.white : AppColor.secoundColor,
            height: 1,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
