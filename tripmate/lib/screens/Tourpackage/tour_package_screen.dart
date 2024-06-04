import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:tripmate/screens/Tourpackage/controller/tour_package_controller.dart';
import 'package:tripmate/screens/Tourpackage/model/tourpackage_model.dart';
import 'package:tripmate/screens/agent_detail_screen/controller/agent_controller.dart';
import 'package:tripmate/widgets/custom_text_form_field.dart';
import 'package:tripmate/widgets/placelocation.dart';
import 'package:tripmate/widgets/placename.dart';

import '../../core/app_exports.dart';
import '../../data/constants.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/searchfield.dart';
import '../hotel/room_payment_with_chapa.dart';
import '../agent_detail_screen/model/tour_agent_model.dart';

class TourPackageScreen extends GetWidget<TourPackageController> {
  TourPackageScreen({super.key});
  AgentController agentController = Get.put(AgentController());
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 2,
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
                        onchanged: (newValue) {
                          controller.searchTourpackage(newValue);
                        },
                        controller: controller.searchController,
                        screenWidth: screenWidth * 1.1,
                        screenHeight: screenHeight,
                      ),
                    ),
                  ],
                ),
              ),
              Gap(screenHeight * 0.02),
              TabBar(indicatorColor: theme.colorScheme.onPrimary, tabs: [
                Tab(
                  child: PlaceTitle(
                      placeName: "Package", screenWidth: screenWidth),
                ),
                Tab(
                  child:
                      PlaceTitle(placeName: "Agent", screenWidth: screenWidth),
                ),
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
                    FutureBuilder(
                      future: controller.fetchTourpackages(),
                      builder: (context, snapshot) => snapshot
                                  .connectionState ==
                              ConnectionState.waiting
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Obx(() => customListView(controller.filteredTours)),
                    ),
                    FutureBuilder(
                      future: agentController.fetchTourAgents(''),
                      builder: (context, snapshot) =>
                          snapshot.connectionState == ConnectionState.waiting
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Obx(() => gridView(
                                  screenWidth, screenHeight, agentController)),
                    ),
                  ]),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}

GridView gridView(
    double screenWidth, double screenHeight, AgentController controller) {
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: screenWidth * 0.02,
        mainAxisSpacing: screenHeight * 0.02,
        mainAxisExtent: screenHeight * 0.32),
    itemCount: controller.agents.length, // Number of items to display
    itemBuilder: (context, index) {
      return tourAgentCard(
        screenWidth,
        screenHeight,
        controller.agents[index],
      );
    },
  );
}

Widget tourAgentCard(
    double screenWidth, double screenHeight, TourAgentModel agent) {
  AgentController agentController = Get.put(AgentController());

  return InkWell(
    onTap: () async {
      agentController.getSingleAgent(agent.agentId!);
      Get.toNamed(AppRoutes.agentDetailScreen, arguments: {
        'agent': agent,
      });
    },
    child: Container(
      width: screenWidth * 0.4,
      height: screenHeight * 0.5,
      decoration: BoxDecoration(
          border: Border.all(color: theme.colorScheme.onPrimary, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(screenWidth * 0.03))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(screenWidth * 0.02),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: screenHeight * 0.21,
              width: screenWidth * 0.41,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(screenWidth * 0.03),
                      topRight: Radius.circular(screenWidth * 0.03)),
                  child: FadeInImage.assetNetwork(
                      placeholder: Constants.imgPlaceHolder,
                      image: agent.profileImage!,
                      fit: BoxFit.cover)),
            ),
          ),
          Gap(screenWidth * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.036),
            child: Container(
              width: screenWidth * 2,
              child: Row(
                children: [
                  PlaceTitle(
                      placeName: agent.companyName,
                      screenWidth: screenWidth * 0.5),
                  Stack(
                    children: [
                      Container(
                        color: Colors.white,
                        height: screenWidth * 0.06,
                        width: screenWidth * 0.07,
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Icon(
                          Icons.verified,
                          size: screenWidth * 0.04,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.036),
            child: Text(
              agent.description!,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: screenWidth * 0.026,
                color: theme.colorScheme.onPrimary.withOpacity(0.5),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.036),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PlaceLocation(
                    icondata: Icons.location_on,
                    screenWidth: screenWidth,
                    loctaion: agent.address),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

ListView customListView(List<TourpackageModel> tours) {
  return ListView.builder(
    itemCount: tours.length,
    itemBuilder: (context, index) => CustomRoomCard(tour: tours[index]),
  );
}

class CustomRoomCard extends GetWidget<TourPackageController> {
  final TourpackageModel tour;
  CustomRoomCard({super.key, required this.tour});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        controller.goToPackageDetail(tour.iId!);
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.all(5),
        height: height * 0.12,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(
            color: theme.colorScheme.onPrimary.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            SizedBox(
              width: width * 0.3,
              height: height * 0.11,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
                child: FadeInImage.assetNetwork(
                  placeholder: Constants.hotelImg,
                  image: tour.image![0],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: width * 0.02,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: width * 0.3,
                          child: Text(
                            tour.packageName!,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16,
                              color: theme.colorScheme.onPrimary,
                            ),
                          ),
                        ),
                        Text(
                          "${tour.totalSpace} Spaces",
                          style: TextStyle(
                            fontSize: 12,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    Text.rich(TextSpan(
                      text: "${tour.packagePrice} BIRR",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onPrimary),
                    )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${tour.spaceLeft} Left",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onPrimary),
                    ),
                    SizedBox(
                      width: width * 0.17,
                    ),
                    CustomElevatedButton(
                      width: width * 0.25,
                      height: height * 0.04,
                      text: "Subscribe",
                      buttonStyle: CustomButtonStyles.outlinePrimaryTL5,
                      buttonTextStyle: TextStyle(
                        color: theme.colorScheme.background,
                      ),
                      onPressed: () {
                        subscribegDialog.showRatingDialog(
                            context, controller, tour.iId!);
                        // controller.subscribePackage(tour.iId!, 2);
                      },
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class subscribegDialog {
  static void showRatingDialog(
      BuildContext context, TourPackageController controller, String tourId) {
    TextEditingController amountController = TextEditingController();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Subscribription',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          width: screenWidth * 0.2,
                          height: screenHeight * 0.05,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.onPrimary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Text(
                            'Amount',
                            style:
                                TextStyle(color: theme.colorScheme.background),
                          ))),
                      CustomTextFormField(
                        alignment: Alignment.center,
                        controller: amountController,
                        borderDecoration: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        width: screenWidth * 0.2,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.012,
                            horizontal: screenWidth * 0.04),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  CustomElevatedButton(
                    buttonStyle: CustomButtonStyles.outlinePrimaryTL10,
                    width: screenWidth * 0.3,
                    height: screenHeight * 0.05,
                    text: 'Subcribe',
                    buttonTextStyle:
                        TextStyle(color: theme.colorScheme.background),
                    onPressed: () async {
                      await controller.subscribePackage(
                          tourId, int.parse(amountController.text));
                      Get.back();
                      Get.to(() => ChapaPaymentScreen(
                            url: controller.paymentUrl.value,
                          ));

                      // Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
