import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:tripmate/screens/ShopListScreen/controller/shop_list_controller.dart';
import 'package:tripmate/widgets/placelocation.dart';
import 'package:tripmate/widgets/placename.dart';
import 'package:tripmate/widgets/shops_card.dart';

import '../../core/app_exports.dart';
import '../../widgets/searchfield.dart';

class ShopListScreen extends StatelessWidget {
  ShopListScreen({super.key});

  ShopListController controller = ShopListController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 1,
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
                        onchanged: (value) {
                          controller.filterShopList(value);
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
              TabBar(
                  indicatorColor: theme.colorScheme.onPrimary,
                  indicatorPadding: EdgeInsets.all(0),
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  tabs: [
                    Tab(
                      child: PlaceTitle(
                          placeName: "Shops", screenWidth: screenWidth),
                    ),
                  ]),
              Gap(screenHeight * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.04,
                ),
                child: FutureBuilder(
                  future: controller.fetchShops(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SizedBox(
                          height: screenHeight * 0.8,
                          width: screenWidth,
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: screenWidth * 0.02,
                              mainAxisSpacing: screenHeight * 0.02,
                              mainAxisExtent: screenHeight * 0.35,
                            ),
                            itemCount: 6,
                            itemBuilder: (context, index) {
                              return Shimmer.fromColors(
                                baseColor: Colors.grey.shade300,
                                highlightColor: Colors.grey.shade100,
                                child: Container(
                                  width: screenWidth * 0.4,
                                  height: screenHeight * 0.5,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(screenWidth * 0.06))),
                                ),
                              );
                            },
                          ));
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      return SizedBox(
                        height: screenHeight * 0.8,
                        width: screenWidth,
                        child: Obx(() {
                          if (controller.filteredShopList.isEmpty) {
                            return const Center(
                                child: Text('No shops available.'));
                          } else {
                            return TabBarView(
                              children: [
                                GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: screenWidth * 0.02,
                                    mainAxisSpacing: screenHeight * 0.02,
                                    mainAxisExtent: screenHeight * 0.35,
                                  ),
                                  itemCount: controller.filteredShopList.length,
                                  itemBuilder: (context, index) {
                                    final shop =
                                        controller.filteredShopList[index];
                                    return ShopCard(
                                        imageUrl: shop.imageUrls!.first,
                                        screenWidth: screenWidth,
                                        screenHeight: screenHeight,
                                        serviceName:
                                            shop.companyName ?? 'Unnamed Shop',
                                        adress: shop.address ?? 'ArbaMinch',
                                        ontap: () {
                                          Get.toNamed(AppRoutes.productList,
                                              arguments: {
                                                'owner_id': shop.ownerId
                                              });
                                        });
                                  },
                                ),
                              ],
                            );
                          }
                        }),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
