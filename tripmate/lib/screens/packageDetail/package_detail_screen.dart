import 'package:flutter/material.dart';
import 'package:tripmate/core/app_exports.dart';
import 'package:tripmate/widgets/placename.dart';

import '../../widgets/placelocation.dart';
import '../../widgets/slidecard.dart';
import '../BlogScreen/blog_detail.dart';

class PackageDetailScreen extends StatelessWidget {
  const PackageDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        height: double.maxFinite,
        child: Stack(children: [
          Container(
              width: double.infinity,
              height: screenHeight * 0.7,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(ImageConstant.image2),
                      fit: BoxFit.cover)),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomAppBar(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      title: '',
                    ),
                  ],
                ),
              )),
          DraggableScrollableSheet(
            initialChildSize: 0.5, // The initial height of the sheet
            minChildSize: 0.5, // The minimum height of the sheet
            maxChildSize: 0.8, // The maximum height of the sheet
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color of the sheet
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(
                            screenWidth * 0.08)), // Rounded corners on the top
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26, // Shadow color
                        blurRadius: 10, // Shadow blur
                        spreadRadius: 1, // Shadow spread
                      ),
                    ],
                  ),
                  // ListView inside the DraggableScrollableSheet
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.06,
                        vertical: screenHeight * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            PlaceTitle(
                                screenWidth: screenWidth * 1.6,
                                placeName: "Chamo"),
                            Gap(screenWidth * 0.02),
                            const Text(
                              '3.5',
                              style: TextStyle(
                                  color: Colors.amber,
                                  fontWeight: FontWeight.w600),
                            ),
                            Gap(screenWidth * 0.01),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: screenWidth * 0.04,
                            ),
                            Gap(screenWidth * 0.3),
                            PlaceTitle(
                                screenWidth: screenWidth / 0.8,
                                placeName: "500"),
                            Icon(
                              Icons.attach_money,
                              color: Colors.amber,
                              size: screenWidth * 0.08,
                            ),
                          ],
                        ),
                        PlaceLocation(
                            icondata: Icons.location_disabled,
                            screenWidth: screenWidth,
                            loctaion: "Arbaminch"),
                        Gap(screenWidth * 0.04),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.02),
                          child: Text("Discover",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: theme.colorScheme.onPrimary,
                                  fontSize: screenWidth * 0.06)),
                        ),
                      ],
                    ),
                  ));
            },
          ),
        ]),
      ),
    );
  }
}
