import 'package:flutter/material.dart';
import 'package:tripmate/screens/ProductList/Controller/product_list_controller.dart';
import 'package:tripmate/screens/hotel/rooms_list_screen.dart';
import 'package:tripmate/widgets/placename.dart';

import '../../core/app_exports.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/produxt_card.dart';
import '../../widgets/searchfield.dart';

class ProductListScreen extends StatelessWidget {
  ProductListScreen({super.key});

  ProductListController controller = ProductListController();

  final arguments = Get.arguments as Map<String, dynamic>;

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
                  onchanged: (value) {
                    controller.filterProductList(value);
                  },
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
          child: FutureBuilder(
              future: controller.fetchProduct(arguments['owner_id']),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                    height: screenHeight * 0.8,
                    width: screenWidth,
                    child: ListView.builder(
                      itemCount: 5, // Number of items to display
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                              margin: const EdgeInsets.only(top: 10),
                              padding: const EdgeInsets.all(5),
                              height: screenHeight * 0.15,
                              width: screenWidth,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10),
                              )),
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return Obx(
                    () {
                      return SizedBox(
                        height: screenHeight * 0.8,
                        width: screenWidth,
                        child: ListView.builder(
                          itemCount: controller.filteredProductList
                              .length, // Number of items to display
                          itemBuilder: (context, index) {
                            final product =
                                controller.filteredProductList[index];

                            return ProductCard(
                              imageUrl: product.productImages[0],
                              name: product.productName,
                              total: product.productQuantity,
                              price: product.productPrice,
                              availableProduct: product.productAvailable,
                              description: product.productDescription,
                              ontap: () {
                                Get.toNamed(AppRoutes.productDetail,
                                    arguments: {
                                      'id': product.id,
                                    });
                              },
                            );
                          },
                        ),
                      );
                    },
                  );
                }
              }),
        ),
      ]),
    )));
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
}
