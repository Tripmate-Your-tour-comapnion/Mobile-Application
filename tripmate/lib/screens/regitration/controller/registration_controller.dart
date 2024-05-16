import 'package:flutter/material.dart';
import 'package:tripmate/core/app_exports.dart';
import 'package:tripmate/screens/regitration/model/registration_model.dart';

// ignore: deprecated_member_use
class RegistrationController extends GetxController with SingleGetTickerProviderMixin{

  Rx<registrationModel> registration_model = registrationModel().obs;
   Rx<bool> passwodOscureText = true.obs;
  
   Rx<bool> rememberPasswordCheckbox = false.obs;
   Rx<int> tabBarIndex = 0.obs;
    late TabController tabController;
    
  

   @override
  void onInit() {
     tabController = TabController(length: 2, vsync: this);
      tabController.index = tabBarIndex.value;
      tabController.addListener(() {
      tabBarIndex.value = tabController.index;
    });
    super.onInit();
  }
void changeTabIndex(int index) {
    tabController.animateTo(index); // You can use animateTo to switch tabs smoothly
  }
void obscurePasswordSwitch(){
   passwodOscureText.value = !passwodOscureText.value;
}
}