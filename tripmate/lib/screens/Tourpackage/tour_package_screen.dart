import 'package:flutter/material.dart';

import 'package:tripmate/widgets/placelocation.dart';
import 'package:tripmate/widgets/placename.dart';

import '../../core/app_exports.dart';
import '../../widgets/searchfield.dart';

class TourPackageScreen extends StatelessWidget {
  const TourPackageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.06,
                    right: screenWidth * 0.04,
                    top: screenHeight * 0.008),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: screenHeight * 0.015, left: screenWidth * 0.03),
                      width: screenWidth * 0.11,
                      height: screenWidth * 0.11,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(231, 239, 233, 1),
                          borderRadius: BorderRadius.all(
                              Radius.circular(screenWidth * 0.1))),
                      child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: theme.colorScheme.onPrimary,
                          )),
                    ),
                    Gap(screenWidth * 0.015),
                    Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth * 0.05, top: screenHeight * 0.0116),
                      child: SearchField(
                        hintText: "Search for Everything",
                        onchanged: (value) {},
                        controller: null,
                        screenWidth: screenWidth * 1.1,
                        screenHeight: screenHeight,
                      ),
                    ),
                  ],
                ),
              ),
              Gap(screenHeight * 0.02),
              TabBar(indicatorColor: theme.colorScheme.onPrimary, tabs: [
                Tab(
                  child: PlaceTitle(
                      placeName: "Package", screenWidth: screenWidth),
                ),
                Tab(
                  child:
                      PlaceTitle(placeName: "Agent", screenWidth: screenWidth),
                ),
              ]),
              Gap(screenHeight * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.04,
                ),
                child: SizedBox(
                  height: screenHeight * 0.8,
                  width: screenWidth,
                  child: TabBarView(children: [
                    const Column(
                      children: [],
                    ),
                    gridView(screenWidth, screenHeight),
                    const Column(
                      children: [],
                    )
                  ]),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}

GridView gridView(double screenWidth, double screenHeight) {
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: screenWidth * 0.02,
        mainAxisSpacing: screenHeight * 0.02,
        mainAxisExtent: screenHeight * 0.32),
    itemCount: 30, // Number of items to display
    itemBuilder: (context, index) {
      return tourAgentCard(screenWidth, screenHeight);
    },
  );
}

Container tourAgentCard(double screenWidth, double screenHeight) {
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
                image: DecorationImage(
                    image: AssetImage(
                      ImageConstant.image2,
                    ),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(screenWidth * 0.03),
                    topRight: Radius.circular(screenWidth * 0.03))),
          ),
        ),
        Gap(screenWidth * 0.02),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.036),
          child: SizedBox(
            width: screenWidth * 2,
            child: Row(
              children: [
                PlaceTitle(placeName: "placeName", screenWidth: screenWidth),
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
                        size: screenWidth * 0.04,
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
          child: Text(
            "Please Upload Square Image less than 1MB",
            style: TextStyle(
              fontSize: screenWidth * 0.026,
              color: theme.colorScheme.onPrimary.withOpacity(0.5),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.036),
          child: Row(
            children: [
              PlaceLocation(
                  icondata: Icons.location_on,
                  screenWidth: screenWidth,
                  loctaion: "Chamo"),
              Gap(screenWidth * 0.14),
              const Text(
                '3.5',
                style:
                    TextStyle(color: Colors.amber, fontWeight: FontWeight.w600),
              ),
              Gap(screenWidth * 0.01),
              Icon(
                Icons.star,
                color: Colors.amber,
                size: screenWidth * 0.04,
              )
            ],
          ),
        )
      ],
    ),
  );
}
