import 'package:flutter/material.dart';

import 'package:tripmate/core/app_exports.dart';

class InputField extends StatelessWidget {
  const InputField(
      {super.key,
      required this.hintText,
      required this.onchanged,
      required this.controller,
      required this.screenWidth,
      required this.screenHeight,
      required this.labelText});

  final String hintText;
  final Function? onchanged;
  final TextEditingController? controller;
  final String labelText;
  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            fontSize: screenWidth * 0.033,
            color: theme.colorScheme.onPrimary.withOpacity(0.5),
          ),
        ),
        Gap(screenHeight * 0.012),
        // Add a small spacing between label and field
        SizedBox(
          height: screenHeight * 0.06,
          width: screenWidth * 0.9,
          child: TextFormField(
            controller: controller,
            onChanged: (value) {},
            cursorHeight: screenHeight * 0.024,
            decoration: InputDecoration(
              fillColor: const Color.fromRGBO(231, 239, 233, 1),
              hintText: hintText,
              hintStyle: TextStyle(
                color: theme.colorScheme.onPrimary.withOpacity(0.5),
                fontSize: screenWidth * 0.033,
              ),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color:
                      theme.colorScheme.outline, // Use a color from your theme
                  width: 1, // Set border width
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
