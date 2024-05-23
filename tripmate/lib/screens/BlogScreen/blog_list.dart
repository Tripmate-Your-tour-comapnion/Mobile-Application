import 'package:flutter/material.dart';
import 'package:tripmate/screens/BlogScreen/Controller/blogcontroller.dart';

import '../../widgets/searchfield.dart';
import '../../core/app_exports.dart';

// ignore: must_be_immutable
class BlogScreen extends StatefulWidget {
  BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  final TextEditingController articleSearchController = TextEditingController();
  BlogController controller = BlogController();

  @override
  void initState() {
    controller.fetchAndSetBlog();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: GetBuilder<BlogController>(
        init: controller,
        builder: (_) {
          return Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            screenWidth * 0.08,
                            screenHeight * 0.03,
                            0,
                            0,
                          ),
                          child: Text(
                            "Blog",
                            style: TextStyle(
                              fontSize: screenWidth * 0.06,
                              fontWeight: FontWeight.w800,
                              color: theme.colorScheme.onPrimary,
                              fontFamily: "poppins",
                            ),
                          ),
                        ),
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
                            child: SvgPicture.asset(
                              'assets/images/Vector.svg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.06,
                          vertical: screenHeight * 0.01),
                      child: SizedBox(
                        width: screenWidth,
                        child: SearchField(
                          hintText: "Search for Blogs",
                          onchanged: () {},
                          controller: null,
                          screenWidth: screenWidth * 1.33,
                          screenHeight: screenHeight * 1.2,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.028,
                        ),
                        child: Container(
                          height: screenHeight * 0.707,
                          color: Colors.transparent,
                          child: ListView.builder(
                              itemCount:
                                  Get.find<BlogController>().blogs.length,
                              itemBuilder: (context, index) {
                                return ArticleCard(
                                  screenWidth: screenWidth,
                                  screenHeight: screenHeight,
                                  title: Get.find<BlogController>()
                                      .blogs[index]
                                      .title,
                                  detail: Get.find<BlogController>()
                                      .blogs[index]
                                      .description,
                                  imageurl: Get.find<BlogController>()
                                      .blogs[index]
                                      .imageUrl,
                                  dateTime: Get.find<BlogController>()
                                      .blogs[index]
                                      .dateTime,
                                );
                              }),
                        ))
                  ],
                ),
              )
            ],
          );
        },
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

// Data structure of an article
class ArticleModel {
  final String title;
  final String detil;
  final String imageurl;
  final String dateTime;

  ArticleModel({
    required this.title,
    required this.detil,
    required this.imageurl,
    required this.dateTime,
  });
}

// thsi  is the article card widget  for all comments to have  one card for each
class ArticleCard extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final String title;
  final String detail;
  final String imageurl;
  final String dateTime;
  const ArticleCard(
      {super.key,
      required this.screenWidth,
      required this.screenHeight,
      required this.title,
      required this.detail,
      required this.imageurl,
      required this.dateTime});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> arg = [
      {'title': title},
      {'detail': detail},
      {'imageurl': imageurl},
      {'dateTime': dateTime}
    ];

    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.blogDetail, arguments: arg);
      },
      child: SizedBox(
        height: screenHeight * 0.34,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 0,
          color: const Color.fromRGBO(231, 239, 233, 1),
          margin: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.04, vertical: screenHeight * 0.018),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10)),
                    child: Image.network(
                      imageurl,
                      width: double.infinity,
                      height: screenHeight * 0.12,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: screenHeight * 0.015,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.17,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: screenWidth * 0.1,
                      ),
                      child: RichText(
                        text: TextSpan(
                            text: detail.substring(0, 10),
                            style: const TextStyle(
                              fontFamily: 'poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(42, 42, 42, 0.541),
                              height: 1.0,
                              letterSpacing: -0.165,
                            ),
                            children: [
                              TextSpan(
                                text: '   Read more.',
                                style: TextStyle(
                                    fontFamily: 'poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    height: 1.0,
                                    letterSpacing: -0.165,
                                    color: theme.colorScheme.onPrimary),
                                // recognizer: TapGestureRecognizer()
                                //   ..onTap = () {
                                //     Navigator.of(context)
                                //         .push(MaterialPageRoute(
                                //       settings: RouteSettings(
                                //         arguments: arg,
                                //       ),
                                //       builder: (context) {
                                //         return nul;
                                //       },
                                //     ));
                                //   })
                              )
                            ]),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
