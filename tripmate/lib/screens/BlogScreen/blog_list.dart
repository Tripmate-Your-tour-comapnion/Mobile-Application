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
  final BlogController controller = Get.put(BlogController());

  @override
  void initState() {
    super.initState();
    controller.fetchAndSetBlog();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                        onchanged: (value) {
                          controller.filterBlogList(value);
                        },
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
                      child: FutureBuilder(
                        future: controller.fetchAndSetBlog(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return SizedBox(
                              height: screenHeight * 0.8,
                              width: screenWidth,
                              child: ListView.builder(
                                itemCount: 5, // Number of items to display
                                itemBuilder: (context, index) {
                                  return Shimmer.fromColors(
                                    baseColor: Colors.grey.shade300,
                                    highlightColor: Colors.grey.shade100,
                                    child: Container(
                                        margin: const EdgeInsets.only(
                                            top: 10, left: 10, right: 10),
                                        height: screenHeight * 0.3,
                                        width: screenWidth,
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        )),
                                  );
                                },
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else {
                            return Container(
                                height: screenHeight * 0.707,
                                color: Colors.transparent,
                                child: Obx(() {
                                  return ListView.builder(
                                      itemCount: Get.find<BlogController>()
                                          .filteredBlogList
                                          .length,
                                      itemBuilder: (context, index) {
                                        return ArticleCard(
                                          screenWidth: screenWidth,
                                          screenHeight: screenHeight,
                                          title: Get.find<BlogController>()
                                              .filteredBlogList[index]
                                              .title,
                                          detail: Get.find<BlogController>()
                                              .filteredBlogList[index]
                                              .description,
                                          imageurl: Get.find<BlogController>()
                                              .filteredBlogList[index]
                                              .imageUrl,
                                          dateTime: Get.find<BlogController>()
                                              .filteredBlogList[index]
                                              .dateTime,
                                        );
                                      });
                                }));
                          }
                        },
                      ))
                ],
              ),
            )
          ],
        ),
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
          borderOnForeground: true,
          elevation: 2,
          color: Color.fromARGB(255, 232, 235, 233),
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
                padding: EdgeInsets.only(left: screenWidth * 0.06),
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
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                            text: detail.substring(0, 200),
                            style: const TextStyle(
                              fontFamily: 'poppins',
                              fontSize: 14,
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
