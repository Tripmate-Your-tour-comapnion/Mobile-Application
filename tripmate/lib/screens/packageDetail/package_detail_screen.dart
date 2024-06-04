import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:tripmate/core/app_exports.dart';
import 'package:tripmate/data/constants.dart';
import 'package:tripmate/screens/Tourpackage/controller/tour_package_controller.dart';
import 'package:tripmate/screens/Tourpackage/model/tourpackage_model.dart';
import 'package:tripmate/widgets/custom_elevated_button.dart';
import 'package:tripmate/widgets/placename.dart';

import '../BlogScreen/blog_detail.dart';
import '../Tourpackage/tour_package_screen.dart';
import 'controller/package_detail_controller.dart';

class PackageDetailScreen extends GetWidget<PackageDetailController> {
  TourPackageController packageContoller = Get.put(TourPackageController());
  PackageDetailScreen({super.key});
  final tourPackage =
      (Get.arguments! as Map<String, dynamic>)['package'] as TourpackageModel;
  var focusedIndex = 0;
  void _onItemFocus(int index) {
    focusedIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    print(tourPackage.packageName);
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
                      image: NetworkImage(tourPackage.image![0]),
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
                    child: ListView(
                      controller: scrollController,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PlaceTitle(
                                screenWidth: screenWidth * 0.8,
                                placeName: tourPackage.packageName),
                            Gap(screenWidth * 0.02),
                            Gap(screenWidth * 0.01),
                            Row(
                              children: [
                                PlaceTitle(
                                    screenWidth: screenWidth / 1.2,
                                    placeName:
                                        tourPackage.packagePrice.toString()),
                                Icon(
                                  Icons.attach_money,
                                  color: Colors.amber,
                                  size: screenWidth * 0.08,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Gap(screenWidth * 0.04),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: screenHeight * 0.1,
                                width: screenWidth * 0.35,
                                decoration: BoxDecoration(
                                    color: theme.colorScheme.onPrimary,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      tourPackage.totalSpace!.toString(),
                                      style: TextStyle(
                                          color: theme.colorScheme.background,
                                          fontSize: screenWidth * 0.06,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      "Spaces",
                                      style: TextStyle(
                                          color: theme.colorScheme.background,
                                          fontSize: screenWidth * 0.04),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: screenHeight * 0.1,
                                width: screenWidth * 0.35,
                                decoration: BoxDecoration(
                                    color: theme.colorScheme.background,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: theme.colorScheme.onPrimary)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      tourPackage.spaceLeft!.toString(),
                                      style: TextStyle(
                                          color: theme.colorScheme.onPrimary,
                                          fontSize: screenWidth * 0.06,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      "Available",
                                      style: TextStyle(
                                          color: theme.colorScheme.onPrimary,
                                          fontSize: screenWidth * 0.04),
                                    ),
                                  ],
                                ),
                              )
                            ]),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: screenWidth * 0.03),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Description",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: theme.colorScheme.onPrimary,
                                      fontSize: screenWidth * 0.045)),
                              CustomElevatedButton(
                                onPressed: () {
                                  subscribegDialog.showRatingDialog(context,
                                      packageContoller, tourPackage.iId!);
                                },
                                height: screenHeight * 0.04,
                                text: 'Subscribe',
                                buttonTextStyle: TextStyle(
                                    color: theme.colorScheme.background),
                                width: screenWidth * 0.3,
                                buttonStyle:
                                    CustomButtonStyles.outlinePrimaryTL10,
                              )
                            ],
                          ),
                        ),
                        Obx(() {
                          String discriptionSubString = '';
                          bool isExpanded = controller.isExpanded;
                          if (tourPackage.packageDescription!.length > 90) {
                            if (!isExpanded) {
                              discriptionSubString = tourPackage
                                  .packageDescription!
                                  .substring(0, 90);
                            } else {
                              discriptionSubString =
                                  tourPackage.packageDescription!;
                            }
                          }

                          return Text.rich(TextSpan(
                            text: tourPackage.packageDescription!.length > 90
                                ? discriptionSubString
                                : tourPackage.packageDescription,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 12,
                                color: theme.colorScheme.primary),
                            children: [
                              if (tourPackage.packageDescription!.length > 90)
                                TextSpan(
                                  text: isExpanded
                                      ? 'Read less'
                                      : '... Read more',
                                  style: const TextStyle(
                                    color: Colors.amber,
                                    // decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      controller.expandAndShrink();
                                    },
                                ),
                            ],
                          ));
                        }),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: screenWidth * 0.03),
                          child: Text("Photos",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: theme.colorScheme.onPrimary,
                                  fontSize: screenWidth * 0.045)),
                        ),
                        Container(
                          width: screenWidth,
                          height: screenHeight * 0.2,
                          child: ScrollSnapList(
                            dynamicItemSize: true,
                            dynamicItemOpacity:
                                0.7, // Adjust opacity for the current and next item
                            initialIndex: 1,
                            updateOnScroll: true,
                            curve: Curves.bounceInOut,
                            focusOnItemTap: true,
                            shrinkWrap: true,
                            itemCount: 3,
                            itemSize: screenWidth / 1.7,
                            onItemFocus: _onItemFocus,
                            itemBuilder: (context, int index) {
                              return Container(
                                height: screenHeight * 0.7,
                                width: screenWidth * 0.6,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: FadeInImage.assetNetwork(
                                    placeholder: Constants.hotelImg,
                                    image: tourPackage.image![index],
                                    height: screenHeight * 0.3,
                                    width: screenWidth * 0.3,
                                    filterQuality: FilterQuality.high,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
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
