import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:tripmate/core/app_exports.dart';
import 'package:tripmate/screens/hotel/controller/room_controller.dart';
import 'package:tripmate/screens/hotel/controller/room_reservation_controller.dart';
import 'package:tripmate/screens/hotel/model/hotel_model.dart';
import 'package:tripmate/screens/hotel/model/room_model.dart';
import 'package:tripmate/widgets/custom_elevated_button.dart';

import '../../data/constants.dart';
import 'room_detail_screen.dart';

class RoomListScreen extends GetWidget<RoomController> {
  RoomListScreen({super.key});
  final hotel = Get.arguments as HotelModel;

  @override
  Widget build(BuildContext context) {
    final rooms = controller.findRoomByHotelId(hotel.id.toString()).value;

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.background,
        title: Text(hotel.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SafeArea(
            child: SizedBox(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return CustomRoomCard(
                name: rooms[index].roomName,
                total: rooms[index].roomAmount,
                price: rooms[index].roomPrice,
                rooms: rooms[index].roomsAvailable,
                bookOnPresse: () {},
                cardOnPresse: () => controller.goToRoomDetail(rooms[index].id),
                room: rooms[index],
              );
            },
            itemCount: rooms.length,
          ),
        )),
      ),
    );
  }
}

class CustomRoomCard extends GetWidget<RoomReservationController> {
  @override
  final controller = RoomReservationController();
  final String name;
  final int total;
  final double price;
  final int rooms;
  final VoidCallback bookOnPresse;
  final VoidCallback cardOnPresse;
  final RoomModel room;
  CustomRoomCard(
      {super.key,
      required this.name,
      required this.total,
      required this.price,
      required this.rooms,
      required this.bookOnPresse,
      required this.cardOnPresse,
      required this.room});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: cardOnPresse,
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
                child: Image.asset(
                  Constants.hotelImg,
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
                            name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16,
                              color: theme.colorScheme.onPrimary,
                            ),
                          ),
                        ),
                        Text(
                          "$total Rooms",
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
                        text: "$price USD",
                        style: TextStyle(
                            fontSize: 13,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "$rooms Available",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onPrimary),
                    ),
                    SizedBox(
                      width: width * 0.13,
                    ),
                    CustomElevatedButton(
                      width: width * 0.23,
                      height: height * 0.04,
                      text: "BOOK",
                      buttonStyle: CustomButtonStyles.outlinePrimaryTL5,
                      buttonTextStyle: TextStyle(
                        color: theme.colorScheme.background,
                      ),
                      onPressed: () {
                        PayForRoomPopUp.showDialog(controller, context, room);
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
