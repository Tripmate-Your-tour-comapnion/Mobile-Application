import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:tripmate/core/app_exports.dart';
import 'package:tripmate/data/constants.dart';
import 'package:tripmate/screens/Tourpackage/controller/tour_package_controller.dart';
import 'package:tripmate/screens/agent_detail_screen/model/tour_agent_model.dart';

import '../Tourpackage/tour_package_screen.dart';
import 'controller/agent_controller.dart';

class AgentDeatilScreen extends GetWidget<AgentController> {
  AgentDeatilScreen({super.key});
  final tourpackageController = Get.put(TourPackageController());

  TourAgentModel agent = Get.arguments['agent'];
  var focusedIndex = 0;
  void _onItemFocus(int index) {
    focusedIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: SizedBox(
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(height * 0.03),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.onPrimary.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: theme.colorScheme.background,
                      ),
                    ),
                  ),
                  Gap(height * 0.06),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                              agent.profileImage!,
                            ),
                            maxRadius: width * 0.15,
                          ),
                          Positioned(
                            left: width * 0.2,
                            top: height * 0.11,
                            child: Icon(
                              Icons.verified,
                              color: theme.colorScheme.onPrimary,
                            ),
                          )
                        ],
                      ),
                      Gap(width * 0.04),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width * 0.5,
                            child: Text(
                              agent.companyName!,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: theme.colorScheme.onPrimary,
                                letterSpacing: -0.17,
                                height: width * 0.002,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Obx(
                            () => Text(
                              controller.agentEmail.value,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: theme.colorScheme.onPrimary,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(Icons.location_on,
                                  size: 10,
                                  color: Color.fromRGBO(238, 173, 136, 1)),
                              Text(
                                agent.address!,
                                style: TextStyle(
                                  color: const Color.fromRGBO(238, 173, 136, 1),
                                  fontSize: 10,
                                  height: width * 0.002,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  Gap(height * 0.05),
                  Text(
                    'Description',
                    style: TextStyle(
                        color: theme.colorScheme.onPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  Gap(height * 0.01),
                  Text(
                    agent.description!,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 12,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                  Gap(height * 0.01),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: width * 0.03),
                    child: Text("Photos",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: theme.colorScheme.onPrimary,
                            fontSize: width * 0.045)),
                  ),
                  SizedBox(
                    width: width,
                    height: height * 0.2,
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
                      itemSize: width / 1.7,
                      onItemFocus: _onItemFocus,
                      itemBuilder: (context, int index) {
                        return SizedBox(
                          height: height * 0.7,
                          width: width * 0.6,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: FadeInImage.assetNetwork(
                              placeholder: Constants.hotelImg,
                              image: agent.images![index],
                              height: height * 0.3,
                              width: width * 0.3,
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Gap(height * 0.01),
                  Text(
                    'Package',
                    style: TextStyle(
                        color: theme.colorScheme.onPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  Gap(height * 0.01),
                  SizedBox(
                    height: height * 0.4,
                    child: FutureBuilder(
                      future: tourpackageController.fetchTourpackages(),
                      builder: (context, snapshot) =>
                          snapshot.connectionState == ConnectionState.waiting
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Obx(() => customListView(
                                  tourpackageController.filteredTours)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
