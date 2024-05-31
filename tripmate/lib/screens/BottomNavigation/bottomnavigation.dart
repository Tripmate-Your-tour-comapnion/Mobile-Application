import 'package:flutter/material.dart';
import 'package:tripmate/screens/BlogScreen/blog_list.dart';
import 'package:tripmate/screens/homescreen/homescreen.dart';
import '../BottomNavigation/controller/bottomnavcontroller.dart';
import '../../core/app_exports.dart';

class BottomNavigation extends StatelessWidget {
  final BottomNavBarController controller =
      Get.find<BottomNavBarController>(); // Get from anywhere

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GetBuilder<BottomNavBarController>(builder: (_) {
      return Scaffold(
        body: SafeArea(
            child: IndexedStack(
          index: controller.tabIndex,
          children: [
            const HomeScreen(),
            BlogScreen(),
          ],
        )),
        bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: theme.colorScheme.primary,
            selectedItemColor: theme.colorScheme.onPrimary,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            showSelectedLabels: true,
            items: [
              _bottomNavigationBar(size, "Home", Icons.home),
              _bottomNavigationBar(size, "Blog", Icons.newspaper),
              _bottomNavigationBar(size, "Services", LineIcons.servicestack),
              _bottomNavigationBar(size, "Setting", Icons.settings),
            ]),
      );
    });
  }
}

_bottomNavigationBar(Size size, String label, IconData iconData) {
  return BottomNavigationBarItem(
      icon: Icon(iconData, size: size.width * 0.08), label: label);
}
