import 'package:flutter/material.dart';
import 'package:pckode/core/constant/color.dart';

class CustomButtonCart extends StatelessWidget {
  final String textButton;

  final void Function()? onPressed;

  const CustomButtonCart({Key? key, required this.textButton, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: MaterialButton(
        color: AppColor.primaryColr,
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text(
          textButton,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
