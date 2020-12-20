import 'package:get/get.dart';
import 'package:interiori/network/api_network.dart';
import 'package:interiori/utils/shared_preferences_manager.dart';

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
}
