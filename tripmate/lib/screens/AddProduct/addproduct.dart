import 'package:flutter/material.dart';
import 'package:tripmate/widgets/inputfield.dart';

import '../../core/app_exports.dart';
import '../../widgets/placename.dart';
import '../../widgets/smallInputField.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final screenPadding = screenWidth * 0.06;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          child: Column(children: [
        Padding(
          padding: EdgeInsets.only(
              left: screenPadding,
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
              Gap(screenWidth * 0.04),
              Padding(
                  padding: EdgeInsets.only(top: screenWidth * 0.037),
                  child: PlaceTitle(
                    placeName: "Add product",
                    screenWidth: screenWidth,
                  ))
            ],
          ),
        ),
        Gap(screenHeight * 0.04),
        InputField(
          hintText: "productName",
          onchanged: null,
          controller: null,
          screenWidth: screenWidth,
          screenHeight: screenHeight,
          labelText: 'Product Name',
        ),
        Gap(screenHeight * 0.04),
        InputField(
          hintText: "Description",
          onchanged: null,
          controller: null,
          screenWidth: screenWidth,
          screenHeight: screenHeight,
          labelText: 'Description',
        ),
        Gap(screenHeight * 0.04),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SmallINputField(
              hintText: "Price",
              onchanged: null,
              controller: null,
              screenWidth: screenWidth / 3,
              screenHeight: screenHeight / 1.3,
              labelText: 'Price',
              ontap: () {},
            ),
            Gap(screenHeight * 0.1),
            SmallINputField(
              hintText: "Quantity",
              onchanged: null,
              controller: null,
              screenWidth: screenWidth / 3,
              screenHeight: screenHeight / 1.3,
              labelText: 'Quantity',
              ontap: () {},
            ),
          ],
        ),
        Gap(screenHeight * 0.07),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.02,
          ),
          height: screenHeight * 0.13,
          width: screenWidth * 0.9,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(231, 239, 233, 1),
              borderRadius:
                  BorderRadius.all(Radius.circular(screenWidth * 0.04))),
          child: Row(
            children: [
              Container(
                height: screenHeight * 0.12,
                width: screenWidth * 0.3,
                color: Colors.grey,
              ),
              Gap(screenWidth * 0.02),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(screenHeight * 0.01),
                  Text(
                    "Please Upload Square Image less than 1MB",
                    style: TextStyle(
                      fontSize: screenWidth * 0.026,
                      color: theme.colorScheme.onPrimary.withOpacity(0.5),
                    ),
                  ),
                  Gap(screenHeight * 0.02),
                  Row(
                    children: [
                      buyNowButton(screenHeight, screenWidth, "Upload Image",
                          () {
                        Get.toNamed(AppRoutes.addTourPackage);
                      }),
                      Text(
                        "No File Choosen",
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                          color: theme.colorScheme.onPrimary.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        Gap(screenHeight * 0.1),
        buyNowButton(
          screenHeight * 1.2,
          screenWidth * 1.5,
          "Add Product",
          () {
            Get.toNamed(AppRoutes.addTourPackage);
          },
        )
      ])),
    ));
  }
}

GestureDetector buyNowButton(
    double screenHeight, double screenWidth, String text, VoidCallback onTab) {
  return GestureDetector(
    onTap: onTab,
    child: Container(
        height: screenHeight * 0.045,
        width: screenWidth * 0.28,
        decoration: BoxDecoration(
            color: theme.colorScheme.onPrimary,
            borderRadius:
                BorderRadius.all(Radius.circular(screenWidth * 0.02))),
        child: Align(
            alignment: Alignment.center,
            child: Text(
              text,
              style: const TextStyle(
                  fontWeight: FontWeight.w900, color: Colors.white),
            ))),
  );
}
