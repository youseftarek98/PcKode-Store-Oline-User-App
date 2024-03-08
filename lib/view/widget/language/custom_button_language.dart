import 'package:flutter/material.dart';
import 'package:pckode/core/constant/color.dart';

class CustomButtonLanguage extends StatelessWidget {
  final String textButton;

  final void Function()? onPressed;

  const CustomButtonLanguage(
      {Key? key, required this.textButton, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100),
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




class CustomButtonLanguageSettings extends StatelessWidget {
  final String textButton;

  final void Function()? onPressed;

  const CustomButtonLanguageSettings(
      {Key? key, required this.textButton, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
     // width: double.infinity,
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
