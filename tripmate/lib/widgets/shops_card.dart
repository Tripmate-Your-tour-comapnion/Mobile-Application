import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tripmate/widgets/buynowbutton.dart';
import 'package:tripmate/widgets/placelocation.dart';
import 'package:tripmate/widgets/placename.dart';

import '../core/app_exports.dart';

class ShopCard extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final String? serviceName;
  final String? adress;
  final VoidCallback ontap;
  final String imageUrl;

  ShopCard(
      {super.key,
      required this.screenWidth,
      required this.screenHeight,
      required this.serviceName,
      this.adress,
      required this.ontap,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 0.4,
      height: screenHeight * 0.5,
      decoration: BoxDecoration(
          border: Border.all(color: theme.colorScheme.onPrimary, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(screenWidth * 0.03))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(screenWidth * 0.02),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: screenHeight * 0.21,
              width: screenWidth * 0.41,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(screenWidth * 0.03),
                      topRight: Radius.circular(screenWidth * 0.03))),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.all(Radius.circular(screenWidth * 0.039)),
                child: FadeInImage.assetNetwork(
                  placeholder:
                      ImageConstant.image1, // Path to your placeholder image
                  image: imageUrl,
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
          Gap(screenWidth * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.036),
            child: Container(
              width: screenWidth * 1.8,
              child: Row(
                children: [
                  PlaceTitle(
                      placeName: serviceName, screenWidth: screenWidth / 1.2),
                  Stack(
                    children: [
                      Container(
                        color: Colors.white,
                        height: screenWidth * 0.06,
                        width: screenWidth * 0.07,
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Icon(
                          Icons.verified,
                          size: screenWidth * 0.036,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.036),
            child: PlaceLocation(
                icondata: Icons.location_on,
                screenWidth: screenWidth,
                loctaion: adress),
          ),
          Gap(screenWidth * 0.03),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.036),
            child: Row(
              children: [
                buyNowButton(
                    icondata: LineIcons.shoppingBasket,
                    ontap: ontap,
                    buttonLabel: 'Shop Now',
                    screenHeight: screenHeight / 1.09,
                    screenWidth: screenWidth / 1.1),
                Gap(screenWidth * 0.0),
                // const Text(
                //   '3.5',
                //   style: TextStyle(
                //       color: Colors.amber, fontWeight: FontWeight.w600),
                // ),
                // Gap(screenWidth * 0.01),
                // Icon(
                //   Icons.star,
                //   color: Colors.amber,
                //   size: screenWidth * 0.04,
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}
