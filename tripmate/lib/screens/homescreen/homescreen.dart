import 'package:flutter/material.dart';

import 'package:tripmate/core/app_exports.dart';
import '../../widgets/searchfield.dart';
import '../../widgets/slidecard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.06,
                  right: screenWidth * 0.04,
                  top: screenHeight * 0.008),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.018),
                    child: Container(
                        width: screenWidth * 0.12,
                        height: screenWidth * 0.12,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(231, 239, 233, 1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.person_2_outlined,
                          color: theme.colorScheme.onPrimary,
                        )),
                  ),
                  Gap(screenWidth * 0.01),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(screenWidth * 0.03),
                      Text(
                        "Hello,",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: theme.colorScheme.onPrimary,
                            fontSize: screenWidth * 0.033),
                      ),
                      Text("James",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: theme.colorScheme.onPrimary,
                              fontSize: screenWidth * 0.033)),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: screenWidth * 0.05, top: screenHeight * 0.0116),
                    child: SearchField(
                      hintText: "Search for Everything",
                      onchanged: () {},
                      controller: null,
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                    ),
                  )
                ],
              ),
            ),
            // The Discovery PageView
            Gap(screenHeight * 0.04),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
              child: Text("Discover",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.onPrimary,
                      fontSize: screenWidth * 0.06)),
            ),
            Gap(screenHeight * 0.02),
            Container(
              height: screenHeight * 0.36,
              width: screenWidth,
              color: Colors.white,
              child: Stack(
                children: [
                  PageView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    controller: PageController(
                        viewportFraction: 0.98), // Set viewport size
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return SlideCard(
                        index: index,
                        color: theme.colorScheme.onPrimary,
                        imageUrl: "ImageConstant.image2.jpg",
                        placeName: "Chamo Lake",
                        loctaion: "Arbaminch,Ethiopia",
                        ontap: () {
                          Get.toNamed(AppRoutes.discoveryDetail);
                        },
                        icondata: Icons.location_history,
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                      );
                    },
                  ),
                ],
              ),
            ),

            Gap(screenHeight * 0.017),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
              child: title(screenWidth, "Popular Categories"),
            ),

            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              circularButton(
                screenWidth,
                screenHeight,
                LineIcons.shoppingCart,
                "Shoping",
                () {
                  Get.toNamed(AppRoutes.shoplist);
                },
              ),
              Gap(screenWidth * 0.06),
              circularButton(
                  screenWidth, screenHeight, Icons.hotel, "Hotels", () {}),
              Gap(screenWidth * 0.06),
              circularButton(screenWidth, screenHeight, Icons.tour, "Tour", () {
                Get.toNamed(AppRoutes.packageDetail);
              }),
            ]),
            Gap(screenHeight * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
              child: title(screenWidth, "Popular Hotels"),
            ),
            // popular Hotels
            Gap(screenHeight * 0.02),
            Container(
              height: screenHeight * 0.4,
              width: screenWidth,
              color: Colors.white,
              child: Stack(
                children: [
                  PageView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: PageController(
                        viewportFraction: 0.8), // Set viewport size
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return SlideCard(
                        index: index,
                        color: theme.colorScheme.onPrimary,
                        imageUrl: null,
                        placeName: "Chamo Lake",
                        loctaion: "Arbaminch,Ethiopia",
                        ontap: () {
                          Get.toNamed(AppRoutes.tourPackage);
                        },
                        icondata: Icons.hotel,
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

// Reusable Widgets

  Text title(double screenWidth, String title) {
    return Text(title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            color: theme.colorScheme.onPrimary,
            fontSize: screenWidth * 0.06));
  }
}

Padding circularButton(double screenWidth, double screenHeight,
    IconData iconData, String title, VoidCallback ontap) {
  return Padding(
    padding:
        EdgeInsets.only(left: screenWidth * 0.06, top: screenHeight * 0.01),
    child: Column(
      children: [
        GestureDetector(
          onTap: ontap,
          child: Container(
              width: screenWidth * 0.2,
              height: screenWidth * 0.2,
              decoration: BoxDecoration(
                color: theme.colorScheme.onPrimary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                iconData,
                color: Colors.white,
              )),
        ),
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontWeight: FontWeight.w700,
              color: theme.colorScheme.onPrimary,
              fontSize: screenWidth * 0.051),
        ),
      ],
    ),
  );
}
