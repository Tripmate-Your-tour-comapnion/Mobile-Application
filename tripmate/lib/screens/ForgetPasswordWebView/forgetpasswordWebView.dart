import 'package:flutter/material.dart';

import '../../core/app_exports.dart';

class ForgotPasswordWebView extends StatefulWidget {
  ForgotPasswordWebView({super.key, required this.resetUrl});
  final String resetUrl;
  @override
  State<ForgotPasswordWebView> createState() => _ForgotPasswordWebViewState();
}

class _ForgotPasswordWebViewState extends State<ForgotPasswordWebView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Forgot Password",
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
              ..loadRequest(Uri.parse(widget.resetUrl))
              ..setNavigationDelegate(NavigationDelegate(
                onProgress: (int progress) {
                  // Update loading bar.
                },
                onUrlChange: (change) {
                  if (change.url ==
                      'https://tourism-management-front.vercel.app/login') {
                    Get.back();
                  }
                },
                onPageStarted: (url) {
                  if (url ==
                      'https://tourism-management-front.vercel.app/login') {
                    Get.back();
                  }
                },
                onNavigationRequest: (NavigationRequest request) {
                  if (request.url.startsWith(
                      'https://tourism-management-front.vercel.app/login')) {
                    Get.back();
                  }
                  return NavigationDecision.navigate;
                },
              ))));
  }
}
