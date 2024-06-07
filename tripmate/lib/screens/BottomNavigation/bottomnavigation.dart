import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tripmate/screens/BlogScreen/blog_list.dart';
import 'package:tripmate/screens/homescreen/homescreen.dart';
import 'package:tripmate/screens/BottomNavigation/controller/bottomnavcontroller.dart';
import 'package:tripmate/screens/homescreen/Controller/home_controller.dart';

import '../../theme/theme_helper.dart';
import '../setting/setting_screen.dart';

class BottomNavigation extends StatefulWidget {
  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final BottomNavBarController controller = Get.find<BottomNavBarController>();
  final HomeScreenController homeController = Get.find<HomeScreenController>();

  @override
  void initState() {
    homeController.fetchDestinations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GetBuilder<BottomNavBarController>(builder: (bottomNavBarController) {
      return Scaffold(
        body: SafeArea(
          child: PageView(
            controller: bottomNavBarController.pageController,
            onPageChanged: (index) {
              controller.changeTabIndex(index);
            },
            children: [
              HomeScreen(),
              BlogScreen(),
              BlogScreen(),
              SettingScreen()
              // Add other screens here
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: theme.colorScheme.primary,
          selectedItemColor: theme.colorScheme.onPrimary,
          onTap: (index) {
            bottomNavBarController.changeTabIndex(index);
            
          },
          currentIndex: controller.tabIndex,
          showSelectedLabels: true,
          items: [
            _bottomNavigationBar(size, "Home", Icons.home),
            _bottomNavigationBar(size, "Blog", Icons.newspaper),
            _bottomNavigationBar(size, "Services", LineIcons.servicestack),
            _bottomNavigationBar(size, "Setting", Icons.settings),
          ],
        ),
      );
    });
  }
}

_bottomNavigationBar(Size size, String label, IconData iconData) {
  return BottomNavigationBarItem(
    icon: Icon(iconData, size: size.width * 0.08),
    label: label,
  );
}
