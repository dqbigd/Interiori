import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:interiori/controller/login_controller.dart';
import 'package:interiori/style/color.dart';
import 'package:interiori/utils/shared_preferences_manager.dart';
import 'package:interiori/view/login_page.dart';

class SignUpPage extends StatelessWidget {
  SharedPreferencesManager prefs = SharedPreferencesManager();
  LoginController loginController = Get.put(LoginController());

  TextEditingController fullnameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

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
                    'SIGNUP',
                    style: TextStyle(fontSize: 17),
                  )),
                  SizedBox(
                    height: 40,
                  ),
                  Center(child: Image.asset('assets/images/signup.png')),
                  SizedBox(
                    height: 51,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.70,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.face,
                            color: primaryColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                          ),
                          filled: true,
                          // hintStyle: new TextStyle(color: primaryColor),
                          hintText: "Fullname",
                          fillColor: Color(0XFFDAE3F3)),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.70,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.account_circle_rounded,
                            color: primaryColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                          ),
                          filled: true,
                          // hintStyle: new TextStyle(color: primaryColor),
                          hintText: "Username",
                          fillColor: Color(0XFFDAE3F3)),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.70,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email_rounded,
                            color: primaryColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                          ),
                          filled: true,
                          // hintStyle: new TextStyle(color: primaryColor),
                          hintText: "Email",
                          fillColor: Color(0XFFDAE3F3)),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.70,
                    child: Obx(() {
                      return TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: loginController.isHidePassword.value,
                        decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  loginController.togglePasswordVisibility();
                                },
                                child: Icon(
                                  loginController.isHidePassword.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: loginController.isHidePassword.value
                                      ? Colors.grey
                                      : primaryColor,
                                )),
                            prefixIcon: Icon(
                              Icons.lock_rounded,
                              color: primaryColor,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30.0),
                              ),
                            ),
                            filled: true,
                            // hintStyle: new TextStyle(color: primaryColor),
                            hintText: "Password",
                            fillColor: Color(0XFFDAE3F3)),
                      );
                    }),
                  ),
                  SizedBox(
                    height: 12,
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
                      child: Text("Signup".toUpperCase(),
                          style: TextStyle(fontSize: 14)),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(LoginPage());
                    },
                    child: Text(
                      'Already have an Account ? Login',
                      style: TextStyle(color: primaryColor),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
