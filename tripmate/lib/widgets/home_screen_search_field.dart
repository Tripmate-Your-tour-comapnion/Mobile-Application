import 'package:flutter/material.dart';

import 'package:tripmate/core/app_exports.dart';

class HomeSearchField extends StatelessWidget {
  const HomeSearchField(
      {super.key,
      required this.hintText,
      required this.ontap,
      required this.controller,
      required this.screenWidth,
      required this.screenHeight});

  final String hintText;
  final VoidCallback ontap;
  final TextEditingController? controller;
  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.06,
      width: screenWidth * 0.6,
      child: TextFormField(
        controller: controller,
        onTap: ontap,
        cursorHeight: screenHeight * 0.024,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          fillColor: const Color.fromRGBO(231, 239, 233, 1),
          hintText: hintText,
          hintStyle: TextStyle(
              color: theme.colorScheme.onPrimary.withOpacity(0.5),
              fontSize: screenWidth * 0.033),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(Icons.search,
              size: screenWidth * 0.053, color: theme.colorScheme.onPrimary),
        ),
      ),
    );
  }
}
