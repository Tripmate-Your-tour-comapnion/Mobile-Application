import 'package:flutter/material.dart';
import 'package:tripmate/screens/paymentWebView/payment_web_view.dart';
import 'package:tripmate/screens/productDetail/controller/product_detail_controller.dart';
import 'package:tripmate/screens/productDetail/model/order_model.dart';
import 'package:tripmate/widgets/shimerproductdetail.dart';

import '../../core/app_exports.dart';
import '../../widgets/buynowbutton.dart';
import '../../widgets/placename.dart';
import '../../widgets/slidecard.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({super.key});

  ProductOrderController controller = ProductOrderController();
  final product = Get.arguments as Map<String, dynamic>;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final screenPadding = screenWidth * 0.06;

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: FutureBuilder(
            future: controller.fetchProduct(product['id']),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return ShimmerProductDetail();
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: screenPadding,
                          right: screenWidth * 0.04,
                          top: screenHeight * 0.008),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: screenHeight * 0.015,
                                left: screenWidth * 0.03),
                            width: screenWidth * 0.11,
                            height: screenWidth * 0.11,
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(231, 239, 233, 1),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(screenWidth * 0.1))),
                            child: IconButton(
                                onPressed: () {
                                  // Navigate back to the previous screen
                                  if (product != null) {
                                    Get.back(result: product);
                                  } else {
                                    // Provide a default result or handle the null case
                                    Get.back(result: {});
                                  }
                                },
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: theme.colorScheme.onPrimary,
                                )),
                          ),
                          Gap(screenWidth * 0.015),
                        ],
                      ),
                    ),
                    Gap(screenHeight * 0.06),
                    Container(
                      height: screenHeight * 0.36,
                      width: screenWidth * 0.8,
                      color: Colors.white,
                      child: Stack(
                        children: [
                          PageView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const AlwaysScrollableScrollPhysics(),
                            controller: PageController(
                                viewportFraction: 0.98), // Set viewport size
                            itemCount: controller.product.productImages.length,
                            itemBuilder: (context, index) {
                              return SlideCard(
                                index: index,
                                color: theme.colorScheme.onPrimary,
                                imageUrl:
                                    controller.product.productImages[index],
                                placeName: "",
                                loctaion: "",
                                ontap: () {
                                  Get.toNamed(AppRoutes.addProduct);
                                },
                                icondata: null,
                                screenWidth: screenWidth,
                                screenHeight: screenHeight / 1.1,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenPadding,
                      ),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              // Gap(screenWidth * 0.),
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Text(
                                "4.5",
                                style: TextStyle(
                                    fontSize: screenPadding,
                                    fontWeight: FontWeight.w900,
                                    color: theme.colorScheme.onPrimary),
                              )
                            ],
                          ),
                          Gap(screenWidth * 0.14),
                          Container(
                            height: screenHeight * 0.045,
                            width: screenWidth * 0.25,
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(231, 239, 233, 1),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(screenWidth * 0.02))),
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "${controller.product.productAvailable} Available",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: theme.colorScheme.onPrimary),
                                )),
                          )
                        ],
                      ),
                    ),
                    Gap(screenHeight * 0.03),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenPadding),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: PlaceTitle(
                              placeName: controller.product.productName,
                              screenWidth: screenWidth * 1)),
                    ),
                    Gap(screenHeight * 0.013),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenPadding),
                      child: Container(
                          height: screenHeight * 0.15,
                          alignment: Alignment.center,
                          width: screenWidth,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              controller.product.productDescription,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  color: theme.colorScheme.onPrimary
                                      .withOpacity(0.5)),
                            ),
                          )),
                    ),
                    Gap(screenPadding * 3),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenPadding * 1.5),
                      child: Align(
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Obx(() {
                                  return PlaceTitle(
                                      placeName:
                                          "${(controller.product.productPrice * controller.quantity.value).toString()} USD",
                                      screenWidth: screenWidth);
                                }),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          controller.decreasQuantity();
                                        },
                                        icon: Icon(
                                          Icons.minimize,
                                          color: theme.colorScheme.onPrimary,
                                        )),
                                    Obx(() {
                                      return Container(
                                        width: screenWidth * 0.15,
                                        height: screenHeight * 0.05,
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            controller.quantity.value
                                                .toString(),
                                            style: TextStyle(
                                                color:
                                                    theme.colorScheme.onPrimary,
                                                fontWeight: FontWeight.w800,
                                                fontSize: screenWidth * 0.08),
                                          ),
                                        ),
                                      );
                                    }),
                                    IconButton(
                                        onPressed: () {
                                          controller.increaseQuantity();
                                        },
                                        icon: Icon(
                                          Icons.add,
                                          color: theme.colorScheme.onPrimary,
                                        )),
                                  ],
                                )
                              ],
                            ),
                            Gap(screenPadding / 3),
                            buyNowButton(
                              icondata: LineIcons.shoppingBasket,
                              ontap: () async {
                                Get.dialog(
                                  const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  barrierDismissible: false,
                                );

                                try {
                                  await controller.orderProduct(Order(
                                      productId: product['id'],
                                      quantity: controller.quantity.value));
                                  Get.back();
                                  Get.dialog(
                                    PaymentSummaryPopup(
                                      ProductNaeme:
                                          controller.product.productName,
                                      price: (controller.product.productPrice *
                                              controller.quantity.value)
                                          .toString(),
                                      screenHeight: screenHeight,
                                      screenWidth: screenWidth,
                                      paymentUrl:
                                          controller.paymentModel.checkoutUrl,
                                    ),
                                  );
                                } catch (error) {
                                  print("Error ordering product: $error");
                                  Get.back();

                                  Get.snackbar(
                                    'Error',
                                    'Failed to order product. Please try again later.',
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white,
                                  );
                                }
                              },
                              buttonLabel: 'Buy Now',
                              screenHeight: screenHeight,
                              screenWidth: screenWidth,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              }
              ;
            }),
      )),
    );
  }
}

class PaymentSummaryPopup extends StatelessWidget {
  PaymentSummaryPopup(
      {super.key,
      required this.screenHeight,
      required this.screenWidth,
      required this.paymentUrl,
      required this.ProductNaeme,
      required this.price});
  final double screenHeight;
  final double screenWidth;
  final String paymentUrl;
  final String ProductNaeme;
  final String price;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      semanticLabel: "Order Created Succesfully.",
      icon: Icon(
        Icons.payment,
        size: 60,
        color: theme.colorScheme.onPrimary,
      ),
      title: Text(
        'Payment Summary',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: theme.colorScheme.onPrimary,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Item:'),
              SizedBox(width: 18),
              Text(
                ProductNaeme,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('price:'),
              const SizedBox(width: 18),
              Text(
                '\$ ${price}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Total price:'),
              const SizedBox(width: 18),
              Text(
                '\$ ${price}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text(
            'Close',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.w900),
          ),
        ),
        buyNowButton(
            icondata: LineIcons.moneyCheck,
            screenHeight: screenHeight,
            screenWidth: screenWidth,
            buttonLabel: 'Pay',
            ontap: () {
              Get.back();
              Get.to(() => PaymentViewScreen(paymentUrl: paymentUrl));
            })
      ],
    );
  }
}

void _redirectToPaymentGateway(BuildContext context) {
  // This function should handle the redirection to the payment gateway.
  // For now, it just shows a snackbar message.
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Connection Problem...'),
    ),
  );
}
