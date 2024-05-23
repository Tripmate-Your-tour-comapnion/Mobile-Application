// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../../core/app_exports.dart';
import '../../widgets/slidecard.dart';
import '../../widgets/placename.dart';
import '../../widgets/placelocation.dart';

class DiscoveryDetail extends StatelessWidget {
  DiscoveryDetail({super.key});
  PageController controller = PageController(viewportFraction: 0.98);
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + screenHeight * 0.03),
        child: AppBar(
          automaticallyImplyLeading: false,
          leading: null,
          flexibleSpace: Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.04,
              left: screenWidth * 0.063,
            ),
            child: Row(
              children: [
                Container(
                  width: screenWidth * 0.11,
                  height: screenWidth * 0.11,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(148, 164, 218, 176),
                    borderRadius:
                        BorderRadius.all(Radius.circular(screenWidth * 0.1)),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(screenHeight * 0.01),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.065),
              child: title(size, "Discovery"),
            ),
            Gap(screenHeight * 0.02),
            Container(
              height: size.height * 0.36,
              width: size.width,
              color: Colors.white,
              child: Stack(
                children: [
                  PageView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: controller, // Set viewport size
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return SlideCard(
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                        index: index,
                        color: theme.colorScheme.onPrimary,
                        imageUrl: null,
                        placeName: "",
                        loctaion: "",
                        icondata: null,
                        ontap: () {
                          Get.toNamed(AppRoutes.discoveryDetail);
                        },
                      );
                    },
                  ),
                  Positioned(
                      bottom: screenHeight * 0.01,
                      left: screenWidth * 0.365,
                      child: Align(
                          alignment: Alignment.center,
                          child: SmoothPageIndicator(
                              effect: ExpandingDotsEffect(
                                activeDotColor: theme.colorScheme.onPrimary,
                                dotColor:
                                    const Color.fromRGBO(231, 239, 233, 1),
                              ),
                              controller: controller,
                              count: 3)))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.065),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      PlaceTitle(
                          placeName: "Chamo Lake",
                          screenWidth: screenWidth * 1.2),
                      Gap(screenWidth * 0.02),
                      const Text(
                        '3.5',
                        style: TextStyle(
                            color: Colors.amber, fontWeight: FontWeight.w600),
                      ),
                      Gap(screenWidth * 0.01),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: screenWidth * 0.04,
                      )
                    ],
                  ),
                  PlaceLocation(
                      icondata: Icons.location_on_outlined,
                      screenWidth: screenWidth,
                      loctaion: "Arbaminch,Ethiopia"),
                  Gap(screenHeight * 0.026),
                  PlaceTitle(
                      placeName: "Description", screenWidth: screenWidth * 1),
                  Gap(screenHeight * 0.013),
                  Container(
                      height: screenHeight * 0.15,
                      alignment: Alignment.center,
                      width: screenWidth,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                color: theme.colorScheme.onPrimary
                                    .withOpacity(0.5)),
                            "Lorem ipsum dolorsiLoremsiLoremsiLorem siLorem   siLoremsiLoremsiLoremsiLoremsiLorem siLorem ipsum dolor sit amet consectetur.Lorem ipsum dolor sit amet consectetur.Lorem ipsum dolor sit amet consectetur.t amet consectetur. is id."),
                      )),
                  PlaceTitle(
                      placeName: "Location", screenWidth: screenWidth * 1),
                  Gap(screenHeight * 0.013),
                  Container(
                    height: screenHeight * 0.35,
                    width: screenWidth,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(screenWidth * 0.1))),
                    child: mapView(screenWidth),
                  ),
                  Gap(screenHeight * 0.013),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

Text title(Size size, String title) {
  return Text(title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontWeight: FontWeight.w600,
          color: theme.colorScheme.onPrimary,
          fontSize: size.width * 0.06));
}

Widget mapView(double screenWidth) {
  return FlutterMap(
      options: const MapOptions(
          initialCenter: LatLng(6.0333, 37.55),
          initialZoom: 8,
          interactionOptions:
              InteractionOptions(flags: ~InteractiveFlag.doubleTapZoom)),
      children: [
        openStreetMapTileLayer,
        MarkerLayer(markers: [
          Marker(
              point: const LatLng(6.0333, 37.55),
              child: Icon(
                Icons.location_pin,
                size: screenWidth * 0.1,
                color: Colors.red,
              ))
        ])
      ]);
}

TileLayer get openStreetMapTileLayer => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
    );
