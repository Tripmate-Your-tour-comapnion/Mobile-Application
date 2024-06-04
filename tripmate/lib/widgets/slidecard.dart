import 'package:flutter/material.dart';
import 'package:tripmate/core/utils/image_constant.dart';
import '../widgets/placename.dart';
import '../widgets/placelocation.dart';

class SlideCard extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final int index;
  final Color color;
  final String? imageUrl;
  final String? placeName;
  final String? loctaion;
  final VoidCallback? ontap;
  final IconData? icondata;

  const SlideCard({
    super.key,
    required this.index,
    required this.color,
    this.imageUrl,
    this.placeName,
    this.loctaion,
    required this.ontap,
    required this.icondata,
    required this.screenWidth,
    required this.screenHeight,
  });

  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.053),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: ontap,
            child: Container(
              height: screenHeight * 0.3,
              width: screenWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImageConstant.image2), fit: BoxFit.cover),
                color: color,
                borderRadius:
                    BorderRadius.all(Radius.circular(screenWidth * 0.039)),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PlaceTitle(placeName: placeName, screenWidth: screenWidth),
                PlaceLocation(
                    icondata: icondata,
                    screenWidth: screenWidth,
                    loctaion: loctaion)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
