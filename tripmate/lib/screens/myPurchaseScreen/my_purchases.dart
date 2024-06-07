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
  PurchaseHistoryController controller = PurchaseHistoryController();

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
                        placeName: "Orders", screenWidth: screenWidth / 1.2),
                  ),
                  Tab(
                    child: PlaceTitle(
                        placeName: "Subscription",
                        screenWidth: screenWidth / 1.2),
                  ),
                  Tab(
                    child: PlaceTitle(
                        placeName: "Reservation",
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
                                name: resrvation.hotel.fullName,
                                total: (resrvation.room.roomPrice *
                                    resrvation.room.roomAmount),
                                price: resrvation.room.roomPrice,
                                availableProduct: 0,
                                imageUrl: resrvation.room.roomImage[0],
                                description: resrvation.room.roomDescription);
                          },
                        );
                      }),
                      ListView(
                        children: [],
                      ),
                      ListView(
                        children: [],
                      )
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
