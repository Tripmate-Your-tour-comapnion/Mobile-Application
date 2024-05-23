import 'package:flutter/material.dart';
import 'package:tripmate/core/app_exports.dart';
import 'package:tripmate/data/constants.dart';

import '../../widgets/custom_text_form_field.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            bottom: PreferredSize(
              preferredSize: Size(width, height * 0.17),
              child: Column(
                children: [
                  Text(
                    "TripMate",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 35,
                      color: theme.colorScheme.onPrimary,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.6,
                    child: TabBar(
                      padding: const EdgeInsets.all(20),
                      controller: _tabController,
                      tabs: const [
                        Tab(
                          child: Text(
                            'Login',
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Register',
                          ),
                        ),
                      ],
                      indicatorColor: theme.colorScheme.onPrimary,
                      automaticIndicatorColorAdjustment: true,
                      unselectedLabelColor: theme.colorScheme.primary,
                      labelColor: theme.colorScheme.onPrimary,
                    ),
                  ),
                ],
              ),
            ),
            centerTitle: true,
          ),
          body: TabBarView(
            controller: _tabController,
            children: const [LoginWidget(), RegisterWidget()],
          )),
    );
  }
}

class RegisterWidget extends StatelessWidget {
  const RegisterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('hello');
  }
}

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width,
      height: height * 0.4,
      child: Column(
        children: [
          SizedBox(
            height: height * 0.04,
          ),
          CustomTextFormField(
            width: width * 0.8,
            prefixConstraints:
                const BoxConstraints(maxHeight: 30, minHeight: 30),
            prefix: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SvgPicture.asset(
                Constants.mailIcon,
              ),
            ),
            hintText: "Email Address",
          ),
          SizedBox(
            height: height * 0.04,
          ),
          CustomTextFormField(
            width: width * 0.8,
            prefixConstraints:
                const BoxConstraints(maxHeight: 30, minHeight: 30),
            prefix: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SvgPicture.asset(Constants.lockIcon),
            ),
            hintText: "Password",
            suffix: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SvgPicture.asset(Constants.eyeIcon),
            ),
          ),
        ],
      ),
    );
  }
}
