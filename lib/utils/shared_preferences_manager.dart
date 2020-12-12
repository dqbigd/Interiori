import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  final String KEY_SIGNIN_STATUS = "signin_status";
  final String KEY_TOKEN = "token";

  final String KEY_PROFILE_USER = "profile_user";

  // set when login
  void setLoggedIn(bool status, String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(this.KEY_SIGNIN_STATUS, status);
    prefs.setString(this.KEY_TOKEN, token);
  }

  Future<bool> getSignInStatus() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(this.KEY_SIGNIN_STATUS) ?? false;
  }

  Future<String> getToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(this.KEY_TOKEN) ?? null;
  }

  // set when login (Profile info)
  void setProfile(String user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(this.KEY_PROFILE_USER, user);
  }

  Future<String> getProfileUser() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(this.KEY_PROFILE_USER) ?? null;
  }


}
