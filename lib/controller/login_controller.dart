import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interiori/model/login_model.dart';
import 'package:interiori/network/api_network.dart';
import 'package:interiori/utils/shared_preferences_manager.dart';
import 'package:interiori/view/home_page.dart';
import 'package:interiori/view/login_page.dart';

class LoginController extends GetxController {
  SharedPreferencesManager prefs = SharedPreferencesManager();
  ApiNetwork apiNetwork = ApiNetwork();

  var isHidePassword = true.obs;
  var isLoading = false.obs;
  var role = 1.obs;

  togglePasswordVisibility() {
    isHidePassword.value = !isHidePassword.value;
  }

  postLogin(String email, String password) async {
    isLoading(true);
    try {
      LoginResponse loginResponse = await apiNetwork.login(email, password);

      if (loginResponse != null) {
        // Get.defaultDialog(
        //     title: 'Response',
        //     middleText:
        //         'name : ${loginResponse.token.accessToken}, >${loginResponse.pesan[0].pesan.toString()}<');

        final String token = loginResponse.data.token;
        // final String fullName = loginResponse.data.token;
        print('token : $token');

        prefs.setLoggedIn(true, token);

        ProfileResponse profileResponse = await apiNetwork.profile();

        if (profileResponse != null) {
          prefs.setProfile(profileResponse.data.fullName);
          Get.off(HomePage());
        }
      }
    } finally {
      isLoading(false);
    }
  }

  postSignup(String fullname, String username, String email, String password,
      String role) async {
    isLoading(true);
    try {
      SignUpResponse signUpResponse =
          await apiNetwork.signUp(fullname, username, email, password, role);

      print(signUpResponse);

      if (signUpResponse != null) {
        // Get.defaultDialog(
        //     title: 'Response',
        //     middleText:
        //         'name : ${loginResponse.token.accessToken}, >${loginResponse.pesan[0].pesan.toString()}<');
        if (signUpResponse.message == 'Ok.') {
          Get.snackbar('Success', 'Sign up is successful!',
              snackPosition: SnackPosition.BOTTOM,
              margin: EdgeInsets.only(bottom: 5));

          Future.delayed(const Duration(seconds: 3), () {
            Get.off(LoginPage());
          });
        } else if (signUpResponse.message == 'Found.') {
          Get.snackbar('Oops', 'Username already taken',
              snackPosition: SnackPosition.BOTTOM,
              margin: EdgeInsets.only(bottom: 5));
        }
      }
    } finally {
      isLoading(false);
    }
  }
}
