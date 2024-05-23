import 'package:flutter/material.dart';
import 'package:tripmate/core/app_exports.dart';
import 'package:tripmate/screens/onboarding/controller/onboarding_one_Controller.dart';

import '../../widgets/custom_elevated_button.dart';


class OnboardingOneScreen extends StatelessWidget {
  const OnboardingOneScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 16, 53, 17),
        body: Container(
          width: double.maxFinite,
          padding:  EdgeInsets.symmetric(
            horizontal: size.width*0.03,
            vertical: size.height*0.1,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              Container(
                width: size.width,
                margin:  EdgeInsets.only(right: size.width*0.2),
                child: const Text(
                  "It’s Travel time pack your bag",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style:TextStyle(fontSize: 35,fontWeight: FontWeight.w900,color: Colors.white),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: size.width*0.9,
                margin:  EdgeInsets.only(right: size.width*0.3),
                child:  const Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since.",
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15,color: Colors.white,),
                ),
              ),
              const Spacer(),
              CustomElevatedButton(
              
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                text: "Next",
                buttonTextStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color:  theme.colorScheme.onPrimary,
                ),
                margin: EdgeInsets.symmetric(horizontal: size.width*0.1),
                alignment: Alignment.center,
                onPressed: (){
                  OnboardingOneController().goToOnboardingTwo();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}