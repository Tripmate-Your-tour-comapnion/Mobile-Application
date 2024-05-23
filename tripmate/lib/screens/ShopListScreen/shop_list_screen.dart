import 'package:flutter/material.dart';

import 'package:tripmate/widgets/placelocation.dart';
import '../../core/app_exports.dart';
import '../../widgets/searchfield.dart';
import '../../widgets/custom_elevated_button.dart';

class ShopListScreen extends StatelessWidget {
  const ShopListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                      onchanged: () {},
                      controller: null,
                      screenWidth: screenWidth * 1.1,
                      screenHeight: screenHeight,
                    ),
                  ),
                ],
              ),
            ),
            Gap(screenHeight * 0.03),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: title(screenWidth, "Shops"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: SizedBox(
                height: screenHeight * 0.84,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  controller: PageController(
                      viewportFraction: 0.8), // Set viewport size
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return shopCards(screenWidth, screenHeight);
                  },
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }

  ClipRRect shopCards(double screenWidth, double screenHeight) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(screenWidth * 0.04),
      ),
      child: Container(
        margin: EdgeInsets.only(top: screenHeight * 0.02),
        height: screenHeight * 0.2,
        width: screenWidth,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(231, 239, 233, 1),
        ),
        child: Row(
          children: [
            SizedBox(
              width: screenWidth * 0.46,
              child: Image.asset(
                ImageConstant.image1,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.045),
              child: Column(
                children: [
                  Gap(screenHeight * 0.02),
                  title(screenWidth, "Chamo Shop"),
                  Gap(screenHeight * 0.01),
                  PlaceLocation(
                      icondata: Icons.location_on,
                      screenWidth: screenWidth,
                      loctaion: "Arbaminch,Sikela"),
                  Gap(screenHeight * 0.013),
                  PlaceLocation(
                      icondata: Icons.production_quantity_limits,
                      screenWidth: screenWidth * 1.3,
                      loctaion: "30 Products"),
                  Gap(screenHeight * 0.013),
                  SizedBox(
                      width: screenWidth * 0.24,
                      child: CustomElevatedButton(
                        onPressed: () => Get.toNamed(AppRoutes.productList),
                        height: screenHeight * 0.05,
                        text: "Shop Now ",
                        buttonTextStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontSize: screenWidth * 0.039),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(screenWidth * 0.03)),
                            color: theme.colorScheme.onPrimary),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
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
