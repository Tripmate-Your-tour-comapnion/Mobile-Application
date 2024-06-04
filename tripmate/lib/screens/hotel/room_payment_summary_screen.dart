// ignore_for_file: unused_import, unused_local_variable, unnecessary_import

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tripmate/core/app_exports.dart';
import 'package:tripmate/screens/hotel/controller/hotel_contrller.dart';
import 'package:tripmate/screens/hotel/controller/room_reservation_controller.dart';
import 'package:tripmate/screens/hotel/room_payment_with_chapa.dart';
import 'package:tripmate/widgets/custom_elevated_button.dart';

import '../../theme/theme_helper.dart';
import 'model/hotel_model.dart';
import 'model/room_model.dart';

class RoomPaymentSummaryScreen extends GetWidget<RoomReservationController> {
  RoomPaymentSummaryScreen({super.key});
  final Map<String, dynamic> info = Get.arguments;
  final hotelController = Get.put(HotelController());
  final roomReservationController = Get.put(RoomReservationController());
  @override
  Widget build(BuildContext context) {
    int numOfDays = info['checkOutDate'].difference(info['checkInDate']).inDays;

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.background,
        title: Text(
          "Review",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onPrimary),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SafeArea(
            child: Column(
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            SettingsListItemWidget(
              title: "Room",
              value: info['room'].roomName,
            ),
            SettingsListItemWidget(
              title: "Hotel",
              value: hotelController.findById(info['room'].owner).companyName!,
            ),
            SettingsListItemWidget(
              title: "check in",
              value: DateFormat("d/M/y").format(info['checkInDate']),
            ),
            SettingsListItemWidget(
              title: "check out",
              value: DateFormat("d/M/y").format(info['checkOutDate']),
            ),
            SettingsListItemWidget(title: "Days", value: numOfDays.toString()),
            SettingsListItemWidget(
              title: "Price per day",
              value: "${info['room'].roomPrice} USD",
            ),
            SettingsListItemWidget(
              title: "Total rooms",
              value: "${info['numberOfRooms']}",
            ),
            SettingsListItemWidget(
              title: "Total",
              value:
                  "${numOfDays * info['room'].roomPrice * info['numberOfRooms']} USD",
            ),
            SizedBox(
              height: height * 0.03,
            ),
            CustomElevatedButton(
              onPressed: () async {
                await controller.reserveRoom(
                    info['room'].roomId,
                    DateFormat("d/M/y").format(info['checkInDate']),
                    DateFormat("d/M/y").format(info['checkOutDate']),
                    info['numberOfRooms'],
                    info['numberOfRooms']);
                Get.back();
                Get.to(ChapaPaymentScreen(url: controller.paymentUrl.value),
                    transition: Transition.cupertinoDialog);
              },
              width: width * 0.3,
              text: "Pay",
              buttonStyle: CustomButtonStyles.outlinePrimaryTL10,
              buttonTextStyle:
                  TextStyle(color: theme.colorScheme.background, fontSize: 16),
            )
          ],
        )),
      ),
    );
  }
}

class SettingsListItemWidget extends StatelessWidget {
  final String title;
  final String value;

  const SettingsListItemWidget({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: theme.textTheme.bodyMedium,
            ),
            Text(value)
          ],
        ),
        SizedBox(
          height: height * 0.01,
        ),
      ],
    );
  }
}
