import 'package:get/get.dart';
import 'package:interiori/model/login_model.dart';
import 'package:interiori/network/api_network.dart';
import 'package:interiori/utils/shared_preferences_manager.dart';
import 'package:interiori/view/login_page.dart';

class LoginController extends GetxController {
  SharedPreferencesManager prefs = SharedPreferencesManager();
  ApiNetwork apiNetwork = ApiNetwork();

  var isHidePassword = true.obs;
  var isLoading = false.obs;

  togglePasswordVisibility() {
    isHidePassword.value = !isHidePassword.value;
  }

  postLogin(String username, String password) async {
    isLoading(true);
    // try {
    //   LoginResponse loginResponse = await apiNetwork.login(username, password);
    //
    //   if (loginResponse != null) {
    //     // Get.defaultDialog(
    //     //     title: 'Response',
    //     //     middleText:
    //     //         'name : ${loginResponse.token.accessToken}, >${loginResponse.pesan[0].pesan.toString()}<');
    //
    //     final String token = loginResponse.token.accessToken;
    //     print('token : $token');
    //
    //     prefs.setLoggedIn(true, token);
    //     prefs.setProfile(username);
    //
    //     Get.off(HomePage());
    //   }
    // } finally {
    //   isLoading(false);
    // }
  }

  postSignup(
      String fullname, String username, String email, String password) async {
    isLoading(true);
    try {
      SignUpResponse signUpResponse = await apiNetwork.signUp(
        fullname,
        username,
        email,
        password,
      );

      //   {
      //     "code": "00",
      // "message": "Found.",
      // "data": "Username already taken"
      // }

      if (signUpResponse != null) {
        // Get.defaultDialog(
        //     title: 'Response',
        //     middleText:
        //         'name : ${loginResponse.token.accessToken}, >${loginResponse.pesan[0].pesan.toString()}<');

        Get.off(LoginPage());
      }
    } finally {
      isLoading(false);
    }
  }
}
