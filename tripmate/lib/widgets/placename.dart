import 'package:flutter/material.dart';
import '../core/app_exports.dart';

class PlaceTitle extends StatelessWidget {
  const PlaceTitle({
    super.key,
    required this.placeName,
    required this.screenWidth,
  });

  final String? placeName;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Text(
      placeName!,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        color: theme.colorScheme.onPrimary,
        fontSize: screenWidth * 0.051,
      ),
    );
  }
}
