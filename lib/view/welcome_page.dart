import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:interiori/style/color.dart';
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
                    height: 36,
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
                    height: 51,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.70,
                    height: 39,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: primaryColor)),
                      onPressed: () {},
                      color: primaryColor,
                      textColor: Colors.white,
                      child: Text("Login".toUpperCase(),
                          style: TextStyle(fontSize: 14)),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.70,
                    height: 39,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Color(0XFFDAE3F3))),
                      onPressed: () {
                        Get.to(SignUpPage());
                      },
                      color: Color(0XFFDAE3F3),
                      textColor: Colors.white,
                      child: Text("signup".toUpperCase(),
                          style: TextStyle(fontSize: 14, color: primaryColor)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
