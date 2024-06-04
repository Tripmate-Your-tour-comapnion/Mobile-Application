import '../../../core/app_exports.dart';

class BottomNavBarController extends GetxController {
  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
