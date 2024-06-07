import 'package:flutter/material.dart';

import '../../core/app_exports.dart';

class PaymentViewScreen extends StatefulWidget {
  const PaymentViewScreen({super.key, required this.paymentUrl});
  final String paymentUrl;
  @override
  State<PaymentViewScreen> createState() => _PaymentViewScreenState();
}

class _PaymentViewScreenState extends State<PaymentViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Payment Gateway",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: theme.colorScheme.onPrimary,
          actions: [
            IconButton(
              color: Colors.white,
              icon: const Icon(Icons.refresh),
              onPressed: () {
                // Reload the WebView
                WebViewController().reload();
              },
            ),
          ],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: WebViewWidget(
            controller: WebViewController()
              ..setJavaScriptMode(JavaScriptMode.unrestricted)
              ..setBackgroundColor(const Color(0x00000000))
              ..loadRequest(Uri.parse(widget.paymentUrl))
              ..setNavigationDelegate(NavigationDelegate(
                onProgress: (int progress) {
                  // Update loading bar.
                },
                onPageFinished: (url) {},
                onNavigationRequest: (NavigationRequest request) {
                  if (request.url.startsWith(
                      'https://tourism-management-front.vercel.app/thanks')) {
                    Get.back();
                  }
                  return NavigationDecision.navigate;
                },
              ))));
  }
}
