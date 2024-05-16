import 'package:tripmate/screens/splash/model/splashscreemmodel.dart';

import '../../../core/app_exports.dart';


class SplashScreenController extends GetxController{
    Rx<SplashScreenModel> splashscreennmodelOBJ = SplashScreenModel().obs;
@override
  void onReady() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.toNamed(
        AppRoutes.registerScreen,
      );
    });
    super.onReady();

  }

}

  