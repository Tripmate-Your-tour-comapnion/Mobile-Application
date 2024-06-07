import 'package:flutter/material.dart';

import '../../widgets/history_card.dart';
import '../../widgets/placename.dart';
import '../../widgets/searchfield.dart';
import '../../core/app_exports.dart';
import 'controller/purchase_history_controller.dart';

// ignore: must_be_immutable
class MyPurchaseScreen extends StatelessWidget {
  MyPurchaseScreen({super.key});

  final TextEditingController articleSearchController = TextEditingController();
  // PurchaseHistoryController controller = PurchaseHistoryController();
  final PurchaseHistoryController controller =
      Get.put(PurchaseHistoryController());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        screenWidth * 0.08,
                        screenHeight * 0.03,
                        0,
                        0,
                      ),
                      child: Text(
                        "History",
                        style: TextStyle(
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.w800,
                          color: theme.colorScheme.onPrimary,
                          fontFamily: "poppins",
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(screenHeight * 0.02),
                TabBar(indicatorColor: theme.colorScheme.onPrimary, tabs: [
                  Tab(
                    child: PlaceTitle(
                        placeName: "Reservation",
                        screenWidth: screenWidth / 1.2),
                  ),
                  Tab(
                    child: PlaceTitle(
                        placeName: "Orders", screenWidth: screenWidth / 1.2),
                  ),
                  Tab(
                    child: PlaceTitle(
                        placeName: "Subscription",
                        screenWidth: screenWidth / 1.2),
                  )
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
                      Obx(() {
                        return ListView.builder(
                          itemCount: controller.reservationList.length,
                          itemBuilder: (context, index) {
                            final resrvation =
                                controller.reservationList[index];
                            return HistoryCard(
                                roomName: resrvation.room.roomName,
                                name: resrvation.hotel.fullName,
                                total: (resrvation.room.roomPrice *
                                    resrvation.room.roomAmount),
                                price: resrvation.room.roomPrice,
                                availableProduct: resrvation.room.roomAmount,
                                imageUrl: resrvation.room.roomImage[0],
                                description: resrvation.room.roomDescription);
                          },
                        );
                      }),
                      Obx(() {
                        return ListView.builder(
                          itemCount: controller.reservationList.length,
                          itemBuilder: (context, index) {
                            final purchase = controller.purchaseList[index];
                            return HistoryCard(
                                roomName: purchase.product.productName,
                                name: purchase.shop.fullName,
                                total: (purchase.product.productPrice *
                                    purchase.product.productQuantity),
                                price: purchase.product.productPrice,
                                availableProduct:
                                    purchase.product.productQuantity,
                                imageUrl: purchase.product.productImages[0],
                                description:
                                    purchase.product.productDescription);
                          },
                        );
                      }),
                      Obx(() {
                        return ListView.builder(
                          itemCount: controller.subscriptionList.length,
                          itemBuilder: (context, index) {
                            final subscribe =
                                controller.subscriptionList[index];
                            return HistoryCard(
                                roomName: subscribe.package.packageName,
                                name: subscribe.agency.fullName,
                                total: (subscribe.package.packagePrice *
                                    subscribe.package.spaceLeft),
                                price: subscribe.package.packagePrice,
                                availableProduct: subscribe.package.spaceLeft,
                                imageUrl: subscribe.package.images[0],
                                description:
                                    subscribe.package.packageDescription);
                          },
                        );
                      }),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ])),
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}
