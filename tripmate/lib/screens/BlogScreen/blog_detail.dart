// This is the screen where the user sees the detail of the article

import 'package:flutter/material.dart';

import 'package:tripmate/core/app_exports.dart';

class BlogDetail extends StatelessWidget {
  const BlogDetail({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    var detail = Get.arguments;
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final size = constraints.biggest;
          final screenWidth = size.width;
          final screenHeight = size.height;

          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    width: double.infinity,
                    height: screenHeight * 0.42,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(detail[2]['imageurl']),
                            fit: BoxFit.cover)),
                    child: SafeArea(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomAppBar(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          title: "Blog",
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenHeight * 0.0,
                              vertical: screenHeight * 0.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                detail[0]['title'],
                                style: TextStyle(
                                  fontFamily: 'poppins',
                                  fontSize: screenWidth * 0.07,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: -0.165,
                                  color: const Color.fromRGBO(231, 239, 233, 1),
                                ),
                              ),
                              SizedBox(
                                height: screenHeight * 0.02,
                              ),
                            ],
                          ),
                        )
                      ],
                    ))),
                SizedBox(
                  height: screenHeight * 0.6,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                now.format(pattern: 'MM-dd-yyyy'),
                                style: const TextStyle(
                                  fontFamily: 'PlusJakartaSans',
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w500,
                                  height: 13.0 / 10.0,
                                  letterSpacing: -0.165,
                                ),
                              ),
                              const Text(
                                'Tripmate',
                                style: TextStyle(
                                  fontFamily: 'PlusJakartaSans',
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w500,
                                  height: 13.0 / 10.0,
                                  letterSpacing: -0.165,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          Text(
                            detail[1]['detail'],
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              fontFamily: 'poppins',
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              height: 13.0 / 10.0,
                              letterSpacing: -0.165,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

//  thsis is custom appbar used in the above widget tree ..................fully customizable in terms of color,sizeee

class CustomAppBar extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final String title;
  const CustomAppBar(
      {super.key,
      required this.screenWidth,
      required this.screenHeight,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
            screenWidth * 0.04,
            screenHeight * 0.02,
            0,
            0,
          ),
          child: Container(
            width: screenWidth * 0.1,
            height: screenWidth * 0.1,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(231, 239, 233, 1),
              borderRadius: BorderRadius.circular(screenWidth * 0.05),
            ),
            child: Material(
              color: Colors.transparent,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: screenWidth * 0.06,
                ),
                color: theme.colorScheme.onPrimary,
                iconSize: screenWidth * 0.055,
              ),
            ),
          ),
        ),
        // Padding(
        //   padding: EdgeInsets.fromLTRB(
        //     screenWidth * 0.05,
        //     screenHeight * 0.03,
        //     0,
        //     0,
        //   ),
        //   child: Text(
        //     "Blog",
        //     style: TextStyle(
        //       color: Colors.white,
        //       fontSize: screenWidth * 0.05,
        //       fontWeight: FontWeight.w600,
        //       fontFamily: "PlusJakartaSans",
        //     ),
        //   ),
        // ),
        Padding(
          padding: EdgeInsets.only(
            top: screenHeight * 0.04,
            // left: screenWidth * 0.39,
          ),
          child: Container(
            margin: EdgeInsets.only(
              left: screenWidth * 0.48,
            ),
            width: screenWidth * 0.04,
            height: screenWidth * 0.04,
            child: ColorFiltered(
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              child: SvgPicture.asset(
                'assets/images/Vector.svg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomIconsStyle extends StatelessWidget {
  final IconData icondata;
  final String text;
  const CustomIconsStyle(
      {super.key, required this.icondata, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icondata,
          color: Colors.white,
          size: 20,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'PlusJakartaSans',
            fontSize: 10,
            fontWeight: FontWeight.w600,
            height: 1.0,
            letterSpacing: -0.165,
          ),
        )
      ],
    );
  }
}
