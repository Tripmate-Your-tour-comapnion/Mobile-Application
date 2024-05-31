import 'package:flutter/material.dart';

import '../../core/app_exports.dart';
import '../../widgets/placename.dart';
import '../../widgets/slidecard.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final screenPadding = screenWidth * 0.06;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: screenPadding,
                  right: screenWidth * 0.04,
                  top: screenHeight * 0.008),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    padding: EdgeInsets.only(top: screenWidth * 0.037),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_outline)),
                  ),
                ],
              ),
            ),
            Gap(screenHeight * 0.06),
            Container(
              height: screenHeight * 0.36,
              width: screenWidth * 0.8,
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
                        imageUrl: null,
                        placeName: "",
                        loctaion: "",
                        ontap: () {
                          Get.toNamed(AppRoutes.addProduct);
                        },
                        icondata: null,
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenPadding,
              ),
              child: Row(
                children: [
                  Row(
                    children: [
                      Gap(screenWidth * 0.1),
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Text(
                        "4.5",
                        style: TextStyle(
                            fontSize: screenPadding,
                            fontWeight: FontWeight.w900,
                            color: theme.colorScheme.onPrimary),
                      )
                    ],
                  ),
                  Gap(screenWidth * 0.14),
                  Container(
                    height: screenHeight * 0.04,
                    width: screenWidth * 0.21,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(231, 239, 233, 1),
                        borderRadius: BorderRadius.all(
                            Radius.circular(screenWidth * 0.02))),
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "10 left",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: theme.colorScheme.onPrimary),
                        )),
                  )
                ],
              ),
            ),
            Gap(screenHeight * 0.03),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenPadding),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: PlaceTitle(
                      placeName: "Dinguza Scarph",
                      screenWidth: screenWidth * 1)),
            ),
            Gap(screenHeight * 0.013),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenPadding),
              child: Container(
                  height: screenHeight * 0.15,
                  alignment: Alignment.center,
                  width: screenWidth,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color:
                                theme.colorScheme.onPrimary.withOpacity(0.5)),
                        "Lorem ipsum dolorsiLoremsiLoremsiLorem siLorem   siLoremsiLoremsiLoremsiLoremsiLorem siLorem ipsum dolor sit amet consectetur.Lorem ipsum dolor sit amet consectetur.Lorem ipsum dolor sit amet consectetur.t amet consectetur. is id."),
                  )),
            ),
            Gap(screenPadding * 3),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenPadding * 3),
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    PlaceTitle(placeName: "750 Birr", screenWidth: screenWidth),
                    Gap(screenPadding / 2),
                    buyNowButton(screenHeight, screenWidth)
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }

  GestureDetector buyNowButton(double screenHeight, double screenWidth) {
    return GestureDetector(
      child: Container(
        height: screenHeight * 0.045,
        width: screenWidth * 0.36,
        decoration: BoxDecoration(
            color: theme.colorScheme.onPrimary,
            borderRadius:
                BorderRadius.all(Radius.circular(screenWidth * 0.02))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              LineIcons.shoppingBasket,
              color: Colors.amber,
            ),
            Gap(screenWidth * 0.03),
            const Align(
                alignment: Alignment.center,
                child: Text(
                  "Buy Now",
                  style: TextStyle(
                      fontWeight: FontWeight.w900, color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}
