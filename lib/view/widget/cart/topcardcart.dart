import 'package:flutter/material.dart';
import 'package:pckode/core/constant/color.dart';

class TopCardCart extends StatelessWidget {
  final String message;

  const TopCardCart({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 20,
      padding: const EdgeInsets.only(bottom: 5),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: AppColor.thirdColor, borderRadius: BorderRadius.circular(20)),
      child: Text(
        message,
        style: const TextStyle(color: AppColor.primaryColr),
        textAlign: TextAlign.center,
      ),
    );
  }
}
