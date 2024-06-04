import 'package:flutter/material.dart';
import '../core/app_exports.dart';

class PlaceLocation extends StatelessWidget {
  const PlaceLocation({
    super.key,
    required this.icondata,
    required this.screenWidth,
    required this.loctaion,
  });

  final IconData? icondata;
  final double screenWidth;
  final String? loctaion;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icondata,
          size: screenWidth * 0.03,
          color: Colors.amber,
        ),
        SizedBox(width: screenWidth * 0.008),
        Text(
          textAlign: TextAlign.justify,
          loctaion!,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w400,
            color: theme.colorScheme.onPrimary.withOpacity(0.5),
            fontSize: screenWidth * 0.03,
          ),
        ),
      ],
    );
  }
}
