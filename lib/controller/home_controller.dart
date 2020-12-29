import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interiori/network/api_network.dart';
import 'package:interiori/style/color.dart';
import 'package:interiori/utils/shared_preferences_manager.dart';
import 'package:interiori/view/login_page.dart';

class HomeController extends GetxController {
  ApiNetwork apiNetwork = ApiNetwork();
  SharedPreferencesManager prefs = SharedPreferencesManager();

  var user = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getUser();
    super.onInit();
  }

  getUser() {
    prefs.getProfileUser().then((userName) {
      user.value = userName;
    });
  }

  logout() {
    Get.defaultDialog(
        title: 'Confirmation',
        middleText: 'Are you sure want to logout?',
        textCancel: 'Cancel',
        cancelTextColor: primaryColor,
        textConfirm: 'Logout',
        confirmTextColor: Colors.white,
        buttonColor: primaryColor,
        onCancel: () {},
        onConfirm: () {
          prefs.setLoggedIn(false, "");
          prefs.setProfile("");
          Get.reset();
          Get.offAll(LoginPage());

          // LogoutResponse relaxationResponse = await apiNetwork.logout();
          // print(relaxationResponse.message);
          // if (relaxationResponse != null) {
          //   prefs.setLoggedIn(false, "");
          //   prefs.setProfile("");
          //   prefs.setMenuUser(false, false, false, false, false);
          //   Get.reset();
          //   Get.off(LoginPage());
          // }
        });
  }
}
