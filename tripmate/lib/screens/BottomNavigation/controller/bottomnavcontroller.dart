import 'package:flutter/material.dart';

import '../../../core/app_exports.dart';

class BottomNavBarController extends GetxController {
  var tabIndex = 0;
  final PageController pageController = PageController();

  void changeTabIndex(int index) {
    tabIndex = index;
    pageController.jumpToPage(index);
    update();
  }
}
