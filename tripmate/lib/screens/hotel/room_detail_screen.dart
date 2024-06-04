// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl/intl.dart';
import 'package:tripmate/core/app_exports.dart';
import 'package:tripmate/data/constants.dart';
import 'package:tripmate/screens/hotel/controller/room_controller.dart';

import 'package:tripmate/screens/hotel/model/room_model.dart';

import '../../widgets/custom_elevated_button.dart';

class RoomDetailScreen extends GetWidget<RoomController> {
  RoomDetailScreen({super.key});

  final controller = Get.put(RoomController());

  final room = Get.arguments as RoomModel;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              FadeInImage.assetNetwork(
                placeholder: Constants.hotelImg,
                image: room.roomImage![0],
                width: width,
                height: height * 0.3,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: height * 0.025,
                left: width * 0.06,
                child: InkWell(
                  onTap: () {
                    controller.goBack();
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
              )
            ]),
            SizedBox(
              height: height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Executive Room",
                    style: TextStyle(
                      color: theme.colorScheme.onPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text.rich(TextSpan(
                      text: '${room.roomPrice!}',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onPrimary),
                      children: [
                        TextSpan(
                          text: "\n/night",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: theme.colorScheme.primary),
                        )
                      ])),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => RateingDialog.showRatingDialog(
                        context, controller, room.roomId!),
                    child: const Icon(
                      Icons.star_rate,
                      color: Colors.amber,
                    ),
                  ),
                  Text(
                    room.roomRate!.value.toString().length < 3
                        ? room.roomRate!.value.toString()
                        : room.roomRate!.value.toString().substring(0, 3),
                    style: theme.textTheme.bodyMedium,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        PayForRoomPopUp.showDialog(controller, context, room);
                      },
                      child: Text(
                        "Book Now",
                        style: TextStyle(
                          color: theme.colorScheme.onPrimary,
                          decoration: TextDecoration.underline,
                        ),
                      ))
                ],
              ),
            ),
            Obx(() {
              String discriptionSubString = '';
              bool isExpanded = controller.isExpanded;
              if (room.roomDescription!.length > 90) {
                if (!isExpanded) {
                  discriptionSubString = room.roomDescription!.substring(0, 90);
                } else {
                  discriptionSubString = room.roomDescription!;
                }
              }

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text.rich(TextSpan(
                  text: room.roomDescription!.length > 90
                      ? discriptionSubString
                      : room.roomDescription,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 12,
                      color: theme.colorScheme.primary),
                  children: [
                    if (room.roomDescription!.length > 90)
                      TextSpan(
                        text: isExpanded ? '  Read less' : '... Read more',
                        style: const TextStyle(
                          color: Colors.amber,
                          // decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            controller.expandAndShrink();
                          },
                      ),
                  ],
                )),
              );
            }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: FadeInImage.assetNetwork(
                        placeholder: Constants.hotelImg,
                        image: room.roomImage![0],
                        height: height * 0.33,
                        width: width * 0.4,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FadeInImage.assetNetwork(
                            placeholder: Constants.hotelImg,
                            image: room.roomImage![1],
                            height: height * 0.15,
                            width: width * 0.43,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FadeInImage.assetNetwork(
                            placeholder: Constants.hotelImg,
                            image: room.roomImage![2],
                            height: height * 0.15,
                            width: width * 0.43,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    )
                  ]),
            ),
          ],
        )),
      ),
    );
  }
}

class PayForRoomPopUp {
  static void showDialog(
      RoomController controller, BuildContext context, RoomModel room) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        // padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
            color: theme.colorScheme.background,
            borderRadius: BorderRadius.circular(20)),
        height: height * 0.3,
        width: width,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.05,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Check in",
                      style: theme.textTheme.titleSmall,
                    ),
                    InkWell(
                      onTap: () => controller.selectCheckinDate(context),
                      child: Container(
                        width: width * 0.2,
                        height: height * 0.05,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurStyle: BlurStyle.outer,
                                  spreadRadius: 1.5,
                                  offset: Offset(0, 1))
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Obx(
                          () => Center(
                            child: Text(
                              DateFormat('d/M/y')
                                  .format(controller.selectedCheckinDate.value),
                              style: TextStyle(
                                fontSize: 11,
                                color: theme.colorScheme.onPrimary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Check out", style: theme.textTheme.titleSmall),
                    InkWell(
                      onTap: () => controller.selectCheckoutDate(context),
                      child: Container(
                        width: width * 0.22,
                        height: height * 0.05,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurStyle: BlurStyle.outer,
                                  spreadRadius: 1.5,
                                  offset: Offset(0, 1))
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Obx(
                          () => Center(
                            child: Text(
                              DateFormat("d/M/y").format(
                                  controller.selectedCheckoutDate.value),
                              style: TextStyle(
                                fontSize: 11,
                                color: theme.colorScheme.onPrimary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Rooms", style: theme.textTheme.titleSmall),
                    Container(
                      width: width * 0.2,
                      height: height * 0.05,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurStyle: BlurStyle.outer,
                                spreadRadius: 1.5,
                                offset: const Offset(0, 1))
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Obx(
                          () => DropdownButton(
                            value: controller.selectedDropdownItem.value,
                            borderRadius: BorderRadius.circular(5),
                            dropdownColor: theme.colorScheme.background,
                            items: const [
                              DropdownMenuItem(
                                value: 1,
                                child: Text("1"),
                              ),
                              DropdownMenuItem(
                                value: 2,
                                child: Text("2"),
                              ),
                              DropdownMenuItem(
                                value: 3,
                                child: Text("3"),
                              ),
                              DropdownMenuItem(
                                value: 4,
                                child: Text("4"),
                              ),
                            ],
                            onChanged: (value) {
                              controller.selectDropdownItem(value!);
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: height * 0.05,
            ),
            SizedBox(
              width: width * 0.5,
              child: CustomElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  controller.goToPay(
                      room,
                      controller.selectedCheckinDate.value,
                      controller.selectedCheckoutDate.value,
                      controller.selectedDropdownItem.value);
                },
                text: "Book",
                buttonTextStyle: TextStyle(
                    color: theme.colorScheme.background,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
                buttonStyle: CustomButtonStyles.outlinePrimaryTL10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RateingDialog {
  static void showRatingDialog(
      BuildContext context, RoomController controller, String roomId) {
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
                    'Rate this Room',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      controller.rateRoom(roomId, rating);
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Submit',
                      style: theme.textTheme.titleSmall,
                    ),
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
