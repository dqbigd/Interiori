import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:interiori/controller/login_controller.dart';
import 'package:interiori/style/color.dart';
import 'package:interiori/style/component.dart';
import 'package:interiori/utils/shared_preferences_manager.dart';
import 'package:interiori/view/home_page.dart';
import 'package:interiori/view/signup_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  SharedPreferencesManager prefs = SharedPreferencesManager();
  LoginController loginController = Get.put(LoginController());

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void _checkLoggedIn() {
    prefs.getSignInStatus().then((value) {
      if (value) {
        Get.off(HomePage());
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkLoggedIn();
  }

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
                    'LOGIN',
                    style: TextStyle(fontSize: 17),
                  )),
                  SizedBox(
                    height: 40,
                  ),
                  Center(child: Image.asset('assets/images/login.png')),
                  SizedBox(
                    height: 51,
                  ),
                  RoundedInputField(
                    controller: emailController,
                    hintText: "Email",
                    onChanged: (value) {},
                  ),
                  Obx(() {
                    return RoundedPasswordField(
                        controller: passwordController,
                        onTap: () {
                          loginController.togglePasswordVisibility();
                        },
                        iconColor: loginController.isHidePassword.value
                            ? Colors.grey
                            : primaryColor,
                        icon: loginController.isHidePassword.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        onChanged: (value) {},
                        obscureText: loginController.isHidePassword.value);
                  }),
                  SizedBox(
                    height: 12,
                  ),
                  Obx(() {
                    return Visibility(
                      visible: loginController.isLoading.value,
                      child: Column(
                        children: [
                          Center(
                            child: CircularProgressIndicator(),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                        ],
                      ),
                    );
                  }),
                  RoundedButton(
                    text: "LOGIN",
                    press: () {
                      String email = emailController.text;
                      String pass = passwordController.text;

                      if (email != '' && pass != '') {
                        loginController.postLogin(email, pass);
                      } else {
                        Get.snackbar('Oops', 'All fields are required',
                            snackPosition: SnackPosition.BOTTOM,
                            margin: EdgeInsets.only(bottom: 5));
                      }
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.off(SignUpPage());
                    },
                    child: Text(
                      'Don\'t have an Account ? Sign Up',
                      style: TextStyle(color: primaryColor),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
