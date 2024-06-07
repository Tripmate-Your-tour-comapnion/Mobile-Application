import 'package:flutter/material.dart';
import 'package:tripmate/widgets/placelocation.dart';
import 'package:tripmate/widgets/placename.dart';

import '../core/app_exports.dart';
import '../data/constants.dart';
import '../screens/hotel/controller/room_reservation_controller.dart';
import '../screens/hotel/model/room_model.dart';
import '../screens/hotel/room_detail_screen.dart';
import 'custom_elevated_button.dart';

class HistoryCard extends StatelessWidget {
  final String name;
  final num total;
  final num price;
  final num availableProduct;
  final String imageUrl;
  final String description;

  const HistoryCard({
    super.key,
    required this.name,
    required this.total,
    required this.price,
    required this.availableProduct,
    required this.imageUrl,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return InkWell(
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.all(5),
        height: height * 0.15,
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
              width: width * 0.37,
              height: height * 0.136,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  topLeft: Radius.circular(12),
                ),
                child: Image.network(
                  imageUrl,
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
                            width: width * 0.26,
                            child: PlaceTitle(
                                placeName: name, screenWidth: width)),
                        Gap(height * 0.004),
                        PlaceLocation(
                          icondata: LineIcons.productHunt,
                          screenWidth: width,
                          loctaion: "$total products",
                        )
                      ],
                    ),
                    Text.rich(TextSpan(
                        text: "$price USD",
                        style: TextStyle(
                            fontSize: 14.5,
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.onPrimary),
                        children: [])),
                  ],
                ),
                Container(
                  width: width * 0.5,
                  child: Text(
                    description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: width * 0.026,
                      fontWeight: FontWeight.w500,
                      color: theme.colorScheme.onPrimary.withOpacity(0.9),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PlaceLocation(
                        icondata: Icons.event_available,
                        screenWidth: width,
                        loctaion: "$availableProduct  Available"),
                    SizedBox(
                      width: width * 0.06,
                    ),
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
