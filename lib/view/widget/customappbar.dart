import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String titleAppBar;

  final void Function()? onPressedSearch;
  final void Function()? onPressedIconFavorite;

  final void Function(String)? onChanged;

  final TextEditingController mycontroller;

  const CustomAppBar(
      {super.key,
      required this.titleAppBar,
      this.onPressedSearch,
      required this.onPressedIconFavorite,
      this.onChanged,
      required this.mycontroller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10 , bottom: 12),
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
            onChanged: onChanged,
            controller: mycontroller,
            decoration: InputDecoration(
                prefixIcon: IconButton(
                    onPressed: onPressedSearch, icon: const Icon(Icons.search)),
                hintText: titleAppBar,
                hintStyle: const TextStyle(fontSize: 18),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.grey[200]),
          )),
          
          const SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10)),
            width: 60,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: IconButton(
                onPressed: onPressedIconFavorite,
                icon: Icon(
                  Icons.favorite_border_outlined,
                  color: Colors.grey[600],
                  size: 30,
                )),
          ),
        ],
      ),
    );
  }
}
