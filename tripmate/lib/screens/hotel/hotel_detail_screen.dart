import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl/intl.dart';
import 'package:tripmate/core/app_exports.dart';
import 'package:tripmate/screens/hotel/controller/hotel_contrller.dart';
import 'package:tripmate/screens/hotel/model/hotel_model.dart';
import 'package:tripmate/theme/custom_button_style.dart';
import 'package:tripmate/theme/theme_helper.dart';
import 'package:tripmate/widgets/custom_elevated_button.dart';
import 'package:tripmate/widgets/custom_text_form_field.dart';

import '../../data/constants.dart';

class HotelDetailScreen extends GetWidget<HotelController> {
  HotelDetailScreen({super.key});
  final HotelModel hotel = Get.arguments;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    print(hotel.hotelId);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theme.colorScheme.background,
        title: Text(
          "Hotel Details",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onPrimary),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeInImage.assetNetwork(
                  placeholder: Constants.hotelImg,
                  image: hotel.profileImage!,
                  fit: BoxFit.cover,
                  height: height * 0.35,
                  width: width,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TitleOfHotelDescription(title: hotel.companyName!),
                    const Icon(
                      Icons.verified,
                      color: Colors.amber,
                      size: 16,
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: theme.colorScheme.onPrimary,
                        size: 16,
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Text(
                        hotel.address!,
                        overflow: TextOverflow.fade,
                        style: theme.textTheme.bodyMedium,
                      )
                    ],
                  ),
                ),
                const TitleOfHotelDescription(
                  title: "Description",
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Obx(() {
                    String discriptionSubString = '';
                    bool isExpanded = controller.isExpanded;
                    if (hotel.description!.length > 90) {
                      if (!isExpanded) {
                        discriptionSubString =
                            hotel.description!.substring(0, 90);
                      } else {
                        discriptionSubString = hotel.description!;
                      }
                    }

                    return Text.rich(TextSpan(
                      text: hotel.description!.length > 90
                          ? discriptionSubString
                          : hotel.description,
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 12,
                          color: theme.colorScheme.primary),
                      children: [
                        if (hotel.description!.length > 90)
                          TextSpan(
                            text: isExpanded ? 'Read less' : '... Read more',
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
                    ));
                  }),
                ),
                const TitleOfHotelDescription(title: "Gallery"),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  width: width,
                  height: height * 0.2,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(8),
                        width: width * 0.4,
                        height: height * 0.08,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: FadeInImage.assetNetwork(
                            image: hotel.images![index],
                            placeholder: Constants.imgPlaceHolder,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    itemCount: hotel.images!.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                Container(
                  width: width,
                  margin: const EdgeInsets.only(
                      top: 10, left: 20, right: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width * 0.4,
                        child: CustomElevatedButton(
                          onPressed: () {
                            controller.goToRoomListScreen(hotel);
                          },
                          text: "BOOK NOW",
                          buttonStyle: CustomButtonStyles.outlinePrimaryTL5,
                          buttonTextStyle: TextStyle(
                            color: theme.colorScheme.background,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        )),
      ),
    );
  }
}

class TitleOfHotelDescription extends StatelessWidget {
  final String title;
  const TitleOfHotelDescription({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onPrimary),
      ),
    );
  }
}
