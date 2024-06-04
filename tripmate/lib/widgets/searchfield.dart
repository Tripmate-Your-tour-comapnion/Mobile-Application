import 'package:flutter/material.dart';

import 'package:tripmate/core/app_exports.dart';

class SearchField extends StatelessWidget {
  const SearchField(
      {super.key,
      required this.hintText,
      required this.onchanged,
      required this.controller,
      required this.screenWidth,
      required this.screenHeight});

  final String hintText;
  final Function(String) onchanged;
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
        onChanged: onchanged,
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
