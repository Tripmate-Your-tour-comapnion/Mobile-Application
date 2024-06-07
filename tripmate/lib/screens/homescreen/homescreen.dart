import 'package:flutter/material.dart';

import 'package:tripmate/core/app_exports.dart';
import 'package:tripmate/screens/homescreen/Controller/home_controller.dart';
import 'package:tripmate/screens/hotel/controller/hotel_contrller.dart';
import 'package:tripmate/widgets/shimmer_home..dart';
import '../../widgets/searchfield.dart';
import '../../widgets/slidecard.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeScreenController controller = Get.find<HomeScreenController>();
  final HotelController hotelController = HotelController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: FutureBuilder(
          future: Future.wait([
            controller.fetchTopRatedHotels(),
            controller.fetchDestinations(),
          ]),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const ShimmerHomeScreen();
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return Column(
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
                              left: screenWidth * 0.05,
                              top: screenHeight * 0.0116),
                          child: SearchField(
                            hintText: "Search for Everything",
                            onchanged: (value) {},
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
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                    child: Text("Discover",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: theme.colorScheme.onPrimary,
                            fontSize: screenWidth * 0.06)),
                  ),
                  Gap(screenHeight * 0.02),
                  GetBuilder<HomeScreenController>(
                    builder: (GetxController homeController) {
                      return Container(
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
                              itemCount: Get.find<HomeScreenController>()
                                  .destinationList
                                  .length,
                              itemBuilder: (context, index) {
                                return SlideCard(
                                  index: index,
                                  color: theme.colorScheme.onPrimary,
                                  description: Get.find<HomeScreenController>()
                                      .destinationList[index]
                                      .destDescription,
                                  imageUrl: Get.find<HomeScreenController>()
                                      .destinationList[index]
                                      .destImage,
                                  placeName: Get.find<HomeScreenController>()
                                      .destinationList[index]
                                      .destName,
                                  loctaion: "Arbaminch,Ethiopia",
                                  ontap: () {
                                    Get.toNamed(AppRoutes.discoveryDetail,
                                        arguments: {
                                          'placeName':
                                              Get.find<HomeScreenController>()
                                                  .destinationList[index]
                                                  .destName,
                                          'description':
                                              Get.find<HomeScreenController>()
                                                  .destinationList[index]
                                                  .destDescription,
                                          'imageurl':
                                              Get.find<HomeScreenController>()
                                                  .destinationList[index]
                                                  .destImage,
                                          'location':
                                              Get.find<HomeScreenController>()
                                                  .destinationList[index]
                                                  .destLocation
                                        });
                                  },
                                  icondata: Icons.location_history,
                                  screenWidth: screenWidth,
                                  screenHeight: screenHeight,
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  Gap(screenHeight * 0.017),

                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
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
                        screenWidth, screenHeight, Icons.hotel, "Hotels", () {
                      Get.toNamed(AppRoutes.hotelHomeScreen);
                    }),
                    Gap(screenWidth * 0.06),
                    circularButton(
                        screenWidth, screenHeight, Icons.tour, "Tour", () {
                      Get.toNamed(AppRoutes.tourPackage);
                    }),
                  ]),
                  Gap(screenHeight * 0.02),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                    child: title(screenWidth, "Top Rated Hotels"),
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
                          itemCount: controller.topRatedHotels.length,
                          itemBuilder: (context, index) {
                            final topRatedHotel =
                                controller.topRatedHotels[index];
                            return SlideCard(
                              index: index,
                              color: theme.colorScheme.onPrimary,
                              imageUrl: topRatedHotel.profileImage,
                              placeName: topRatedHotel.companyName,
                              loctaion: topRatedHotel.address,
                              ontap: () {
                                hotelController
                                    .goToRoomListScreen(topRatedHotel);
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
              );
            }
          },
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
              width: screenWidth * 0.17,
              height: screenWidth * 0.17,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: theme.colorScheme.onPrimary.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Icon(
                iconData,
                color: theme.colorScheme.onPrimary,
              )),
        ),
        Gap(screenHeight * 0.01),
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
