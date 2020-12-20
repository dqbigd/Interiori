import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:interiori/style/color.dart';
import 'package:interiori/style/component.dart';
import 'package:interiori/view/login_page.dart';
import 'package:interiori/view/signup_page.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          systemNavigationBarColor: Color(0xFF000000),
          systemNavigationBarDividerColor: null,
          statusBarColor: Color(0x00000000),
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 46,
                  ),
                  Center(
                      child: Text(
                    'WELCOME TO INTERIORI',
                    style: TextStyle(fontSize: 17),
                  )),
                  SizedBox(
                    height: 40,
                  ),
                  Center(child: Image.asset('assets/images/welcome.png')),
                  SizedBox(
                    height: 121,
                  ),
                  RoundedButton(
                    text: "LOGIN",
                    press: () {
                      Get.off(LoginPage());
                    },
                  ),
                  RoundedButton(
                    text: "SIGNUP",
                    color: primaryLightColor,
                    textColor: primaryColor,
                    press: () {
                      Get.off(SignUpPage());
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
