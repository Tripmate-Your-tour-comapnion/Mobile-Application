import 'package:flutter/material.dart';
import 'package:tripmate/widgets/placename.dart';

import '../../core/app_exports.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/placelocation.dart';
import '../../widgets/searchfield.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                    borderRadius:
                        BorderRadius.all(Radius.circular(screenWidth * 0.1))),
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
                  onchanged: () {},
                  controller: null,
                  screenWidth: screenWidth * 1.1,
                  screenHeight: screenHeight,
                ),
              ),
            ],
          ),
        ),
        Gap(screenHeight * 0.02),
        Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.06,
            ),
            child: PlaceTitle(
              placeName: "Products",
              screenWidth: screenWidth * 1.1,
            )),
        Gap(screenHeight * 0.02),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.03,
          ),
          child: SizedBox(
            height: screenHeight * 0.8,
            width: screenWidth,
            child: gridView(screenWidth, screenHeight),
          ),
        ),
      ]),
    )));
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
        return productCard(
          screenWidth,
          screenHeight,
          () {
            Get.toNamed(AppRoutes.productDetail);
          },
        );
      },
    );
  }
}

GestureDetector productCard(
    double screenWidth, double screenHeight, VoidCallback ontap) {
  return GestureDetector(
    onTap: ontap,
    child: ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(screenWidth * 0.04),
      ),
      child: Container(
        margin: EdgeInsets.only(top: screenHeight * 0.02),
        height: screenHeight * 0.3,
        width: screenWidth / 2,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(231, 239, 233, 1),
          borderRadius: BorderRadius.all(
            Radius.circular(screenWidth * 0.07),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              ImageConstant.image1,
              fit: BoxFit.cover,
              width: double.infinity,
              height: screenHeight * 0.2,
            ),
            Gap(screenHeight * 0.02),
            PlaceTitle(placeName: "Scarph", screenWidth: screenWidth),
            Gap(screenHeight * 0.0),
            Text(
              '450 Birr',
              style: TextStyle(
                  fontSize: screenWidth * 0.03, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ),
  );
}

Text title(double screenWidth, String title) {
  return Text(title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontWeight: FontWeight.w600,
          color: theme.colorScheme.onPrimary,
          fontSize: screenWidth * 0.043));
}
