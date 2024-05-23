// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
              CustomSearchWidget(
                hint: "Search",
                contentPadding: EdgeInsets.symmetric(vertical: height * 0.02),
                controller: controller.searchController,
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
              child: Text(
                "Hotels",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onPrimary),
              ),
            ),
            Expanded(child: Obx(() {
              final hotels = controller.hotels;

              return Obx(
                () => ListView.builder(
                    itemCount: controller.hotels.length,
                    itemBuilder: (context, index) {
                      return HotelCard(
                        onTap: () {
                          controller.goToHotelDetail(hotels[index].id);
                        },
                        name: hotels[index].name,
                        location: hotels[index].location,
                        services: hotels[index].services,
                        rate: hotels[index].rate.toString(),
                      );
                    }),
              );
            }))
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
  final String location;
  final rate;
  final List<String> services;
  final VoidCallback onTap;
  const HotelCard({
    super.key,
    required this.name,
    required this.location,
    required this.rate,
    required this.services,
    required this.onTap,
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
            color: Color.fromRGBO(231, 239, 233, 1),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 5))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
              child: Image.asset(
                Constants.hotelImg,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 8, left: 8, top: 8),
              child: Text(
                name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: theme.colorScheme.onPrimary),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.amber,
                        size: 16,
                      ),
                      Text(
                        location,
                        style: theme.textTheme.bodyMedium,
                      )
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    width: width * 0.17,
                    height: height * 0.04,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 16,
                          ),
                          Text(
                            rate,
                            overflow: TextOverflow.fade,
                            style: theme.textTheme.bodyMedium,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              height: height * 0.05,
              width: width * 0.9,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: services.length,
                  itemBuilder: (context, index) {
                    return CustomIconTextComponent(
                      service: services[index],
                    );
                  }),
            )
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
      ),
    );
  }
}
