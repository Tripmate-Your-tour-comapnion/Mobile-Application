// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tripmate/core/app_exports.dart';
import 'package:tripmate/screens/hotel/controller/hotel_contrller.dart';
import 'package:tripmate/widgets/custom_text_form_field.dart';

import '../../data/constants.dart';

class HotelsScreen extends GetWidget<HotelController> {
  const HotelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: PreferredSize(
          preferredSize: Size(width, height * 0.15),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              FutureBuilder(
                future: controller.fetchHotels(''),
                builder: (context, snapshot) =>
                    snapshot.connectionState == ConnectionState.waiting
                        ? searchShimmer(context)
                        : CustomSearchWidget(
                            hint: "Search",
                            contentPadding:
                                EdgeInsets.symmetric(vertical: height * 0.02),
                            controller: controller.searchController,
                          ),
              ),
            ],
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: FutureBuilder(
                  future: controller.fetchHotels(''),
                  builder: (context, snapshot) =>
                      snapshot.connectionState == ConnectionState.waiting
                          ? textShimmer(context)
                          : Text(
                              "Hotels",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: theme.colorScheme.onPrimary),
                            ),
                )),
            Expanded(
                child: FutureBuilder(
                    future: controller.fetchHotels(''),
                    builder: (context, snapshot) => snapshot.connectionState ==
                            ConnectionState.waiting
                        ? ListView.builder(
                            itemBuilder: (context, index) =>
                                cardShimmer(context),
                            itemCount: 3,
                          )
                        : Obx(() {
                            return ListView.builder(
                                itemCount: controller.hotels.length,
                                itemBuilder: (context, index) {
                                  return HotelCard(
                                      name:
                                          controller.hotels[index].companyName!,
                                      address:
                                          controller.hotels[index].address!,
                                      profileImg: controller
                                          .hotels[index].profileImage!,
                                      // description: controller.hotels[index].description!,
                                      onTap: () {
                                        controller.goToHotelDetail(
                                            controller.hotels[index].hotelId!);
                                      });
                                });
                          })))
          ],
        )),
      ),
    );
  }
}

class CustomIconTextComponent extends StatelessWidget {
  final String service;
  const CustomIconTextComponent({
    super.key,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width * 0.2,
        padding: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          // color: theme.colorScheme.onPrimary.withOpacity(0.5),
        ),
        child: Center(
          child: Text(
            service,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 12, color: theme.colorScheme.onPrimary),
          ),
        ),
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  final String name;
  final String address;
  final String profileImg;
  // final String description;
  final VoidCallback onTap;
  const HotelCard({
    super.key,
    required this.name,
    required this.address,
    // required this.description,
    required this.onTap,
    required this.profileImg,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        width: width,
        height: height * 0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: theme.colorScheme.onPrimary.withOpacity(0.8),
          border: Border.all(color: theme.colorScheme.onPrimary),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
              child: FadeInImage.assetNetwork(
                placeholder: Constants.hotelImg,
                image: profileImg,
                fit: BoxFit.cover,
                alignment: Alignment.center,
                height: height * 0.2,
                width: width,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 8, left: 8, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: theme.colorScheme.background),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    width: width * 0.1,
                    height: height * 0.03,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.verified,
                            color: Colors.amber,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.amber,
                    size: 16,
                  ),
                  Text(
                    address,
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSearchWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final EdgeInsets contentPadding;
  const CustomSearchWidget({
    super.key,
    required this.controller,
    required this.hint,
    required this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.symmetric(
          vertical: height * 0.02, horizontal: height * 0.02),
      child: CustomTextFormField(
        controller: controller,
        textInputAction: TextInputAction.search,
        prefix: Padding(
          padding: EdgeInsets.only(right: height * 0.01, left: height * 0.03),
          child: SvgPicture.asset(
            Constants.searchIcon,
          ),
        ),
        prefixConstraints: const BoxConstraints(maxHeight: 30, minHeight: 30),
        contentPadding: contentPadding,
        filled: true,
        fillColor: const Color.fromRGBO(231, 239, 233, 1),
        borderDecoration: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        hintText: hint,
        hintStyle: theme.textTheme.bodyMedium,
        textStyle: theme.textTheme.titleSmall,
        prefixIcon: null,
      ),
    );
  }
}

Widget textShimmer(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;

  return Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    enabled: true,
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      width: width * 0.2,
      height: height * 0.03,
    ),
  );
}

Widget searchShimmer(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  return Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    enabled: true,
    child: Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.symmetric(
          vertical: height * 0.02, horizontal: height * 0.02),
      child: CustomTextFormField(
        textInputAction: TextInputAction.search,
        prefix: Padding(
          padding: EdgeInsets.only(right: height * 0.01, left: height * 0.03),
          child: SvgPicture.asset(
            Constants.searchIcon,
          ),
        ),
        prefixConstraints: const BoxConstraints(maxHeight: 30, minHeight: 30),
        contentPadding: EdgeInsets.symmetric(vertical: height * 0.02),
        filled: true,
        fillColor: const Color.fromRGBO(231, 239, 233, 1),
        borderDecoration: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        hintStyle: theme.textTheme.bodyMedium,
        textStyle: theme.textTheme.titleSmall,
        prefixIcon: null,
      ),
    ),
  );
}

Widget cardShimmer(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;

  return Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    enabled: true,
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      width: width,
      height: height * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: theme.colorScheme.onPrimary.withOpacity(0.8),
        border: Border.all(color: theme.colorScheme.onPrimary),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            child: Container(
              height: height * 0.2,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 8, left: 8, top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: width * 0.1,
                ),
                Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    enabled: true,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      width: width * 0.1,
                      height: height * 0.03,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              enabled: true,
                              child: Icon(
                                Icons.verified,
                                size: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.amber,
                  size: 16,
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  enabled: true,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    width: width * 0.1,
                    height: height * 0.03,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
