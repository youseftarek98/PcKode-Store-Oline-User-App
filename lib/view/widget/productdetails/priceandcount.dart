import 'package:flutter/material.dart';
import 'package:pckode/core/constant/color.dart';

class PriceAndCountItems extends StatelessWidget {
  final void Function()? onAdd;

  final void Function()? onRemove;

  final String count;

  final String price;

  const PriceAndCountItems(
      {super.key,
      required this.onAdd,
      required this.onRemove,
      required this.count,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            IconButton(onPressed: onAdd, icon: const Icon(Icons.add)),
            Container(
              width: 50,
              padding: const EdgeInsets.only(bottom: 2),
              alignment: Alignment.center,
              decoration:
                  BoxDecoration(border: Border.all(color: AppColor.black)),
              child: Text(
                count,
                style: const TextStyle(fontSize: 20, height: 1.1),
              ),
            ),
            IconButton(onPressed: onRemove, icon: const Icon(Icons.remove)),
          ],
        ),
        const Spacer(),
        Text(
          '$price \$',
          style: const TextStyle(
              color: AppColor.primaryColr, fontSize: 30, height: 1.1),
        )
      ],
    );
  }
}
