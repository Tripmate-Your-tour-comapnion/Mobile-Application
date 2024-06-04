import 'package:flutter/material.dart';

import '../core/app_exports.dart';

class buyNowButton extends StatelessWidget {
  const buyNowButton({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.buttonLabel,
    required this.ontap,
    required this.icondata,
  });

  final double screenHeight;
  final double screenWidth;
  final String buttonLabel;
  final VoidCallback ontap;
  final IconData icondata;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: screenHeight * 0.045,
        width: screenWidth * 0.36,
        decoration: BoxDecoration(
            color: theme.colorScheme.onPrimary,
            borderRadius:
                BorderRadius.all(Radius.circular(screenWidth * 0.02))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icondata,
              color: Colors.amber,
            ),
            Gap(screenWidth * 0.03),
            Align(
                alignment: Alignment.center,
                child: Text(
                  buttonLabel,
                  style: const TextStyle(
                      fontWeight: FontWeight.w900, color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}
