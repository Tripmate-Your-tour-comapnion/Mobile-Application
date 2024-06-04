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
  final String? description;

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
    this.description,
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
                borderRadius:
                    BorderRadius.all(Radius.circular(screenWidth * 0.039)),
              ),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.all(Radius.circular(screenWidth * 0.039)),
                child: FadeInImage.assetNetwork(
                  placeholder:
                      ImageConstant.image1, // Path to your placeholder image
                  image: imageUrl!,
                  fit: BoxFit.cover,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      ImageConstant.image1, // Path to your error image
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PlaceTitle(
                    placeName: placeName, screenWidth: screenWidth / 1.18),
                PlaceLocation(
                    icondata: icondata,
                    screenWidth: screenWidth / 1.2,
                    loctaion: loctaion)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
