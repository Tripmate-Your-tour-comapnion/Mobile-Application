import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:lottie/lottie.dart';
import 'package:tripmate/core/app_exports.dart';
import 'package:tripmate/screens/confirm_email/controller/confirm_email_controller.dart';
import 'package:tripmate/widgets/custom_elevated_button.dart';

class ConfirmEmailScreen extends GetWidget {
  ConfirmEmailScreen({super.key});
  final data = Get.arguments as Map<String, dynamic>;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GetBuilder<ConfirmPasswordController>(
          init: ConfirmPasswordController(email: data['email']),
          builder: (ConfirmPasswordController controller) {
            controller.sourceData.value = data['source'];
            return SafeArea(
                child: Obx(
              () => Column(
                children: [
                  Gap(height * 0.3),
                  Text(
                    "We have sent you a confirmation email please check your email!",
                    style: TextStyle(
                        color: theme.colorScheme.onPrimary, fontSize: 20),
                  ),
                  Gap(height * 0.02),
                  Text(
                    "The confirmation email will expired after 15 min",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: theme.colorScheme.onPrimary, fontSize: 12),
                  ),
                  Gap(height * 0.01),
                  (controller.sourceData.value == 'signup')
                      ? TimerCountdown(
                          descriptionTextStyle:
                              TextStyle(color: theme.colorScheme.onPrimary),
                          format: CountDownTimerFormat.minutesSeconds,
                          endTime: DateTime.now().add(
                            const Duration(minutes: 15),
                          ),
                          onEnd: () {
                            controller.isTimeEnd.value = true;
                          },
                          timeTextStyle: const TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : SizedBox(),
                  const SizedBox(
                    height: 20,
                  ),
                  (controller.sourceData.value == 'login')
                      ? Expanded(
                          child: Center(
                            child: CustomElevatedButton(
                              width: width * 0.5,
                              text: "Resend",
                              buttonStyle: CustomButtonStyles.outlinePrimaryTL5,
                              buttonTextStyle: TextStyle(
                                  color: theme.colorScheme.background),
                              onPressed: () {
                                controller.sourceData.value = 'signup';
                              
                                controller.resendEmail(data['email']);
                              },
                            ),
                          ),
                        )
                      : Obx(() {
                          if (controller.isTimeEnd.value) {
                            return Expanded(
                              child: Center(
                                child: CustomElevatedButton(
                                  onPressed: () {
                                    controller.resendEmail(data['email']);
                                  },
                                  width: width * 0.5,
                                  text: "Resend",
                                  buttonStyle:
                                      CustomButtonStyles.outlinePrimaryTL5,
                                  buttonTextStyle: TextStyle(
                                      color: theme.colorScheme.background),
                                ),
                              ),
                            );
                          } else {
                            return Expanded(
                                child: Center(
                                    child: CircularProgressIndicator(
                              color: theme.colorScheme.onPrimary,
                            )));
                          }
                        }),
                ],
              ),
            ));
          },
        ),
      ),
    );
  }
}
