import 'package:flutter/material.dart';
import 'package:pckode/core/constant/color.dart';

class CustomButtonAppBar extends StatelessWidget {
  final void Function()? onPressed;

  final String textButton;

  final IconData iconData;

  // final Color colorItemSelected ;
  final bool? active;

  const CustomButtonAppBar(
      {super.key,
      required this.textButton,
      required this.iconData,
      this.onPressed,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color: active == true ? AppColor.primaryColr : AppColor.grey2,
          ),
          // Text(textButton , style: TextStyle(color: active == true ? AppColor.primaryColr : AppColor.grey2),)
        ],
      ),
    );
  }
}
