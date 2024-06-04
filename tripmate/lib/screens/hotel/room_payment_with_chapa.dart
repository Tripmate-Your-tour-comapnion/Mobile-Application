import 'package:flutter/material.dart';
import 'package:tripmate/core/app_exports.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ChapaPaymentScreen extends StatefulWidget {
  ChapaPaymentScreen({super.key, required this.url});
  final String url;

  @override
  State<ChapaPaymentScreen> createState() => _ChapaPaymentScreenState();
}

class _ChapaPaymentScreenState extends State<ChapaPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TripMate'),
        elevation: 0,
      ),
      body: SafeArea(
          child: WebViewWidget(
              controller: WebViewController()
                ..setJavaScriptMode(JavaScriptMode.unrestricted)
                ..setBackgroundColor(const Color(0x00000000))
                ..setNavigationDelegate(
                  NavigationDelegate(
                    onProgress: (int progress) {
                      // Update loading bar.
                    },
                    onUrlChange: (change) {},
                    onPageStarted: (String url) {},
                    onPageFinished: (String url) {},
                    onWebResourceError: (WebResourceError error) {},
                    onNavigationRequest: (NavigationRequest request) {
                      if (request.url
                          .startsWith('http://localhost:5173/thanks')) {
                        Get.back();
                      }
                      return NavigationDecision.navigate;
                    },
                  ),
                )
                ..loadRequest(Uri.parse(widget.url)))),
    );
  }
}
