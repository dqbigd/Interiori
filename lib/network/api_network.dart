import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:interiori/model/gallery_design_model.dart';
import 'package:interiori/model/login_model.dart';
import 'package:interiori/utils/shared_preferences_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiNetwork {
  SharedPreferencesManager sharedPreferencesManager =
      SharedPreferencesManager();

  final String baseUrl = 'http://52522debbeb5.ngrok.io';

  //login
  Future<LoginResponse> login(String email, String password) async {
    var apiUrl = baseUrl + '/auth/signin';

    var response =
        await http.post(apiUrl, body: {"email": email, "password": password});

    if (response.statusCode == 200) {
      var responseString = response.body;

      return loginResponseFromJson(responseString);
    } else if (response.statusCode == 400) {
      Get.snackbar('Unauthorized', 'Username or password invalid',
          snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.only(bottom: 5));
    } else {
      return null;
    }
  }

  //sign up
  Future<SignUpResponse> signUp(String fullname, String username, String email,
      String password, String role) async {
    var apiUrl = baseUrl + '/auth/signup';

    var response = await http.post(apiUrl, body: {
      "full_name": fullname,
      "username": username,
      "email": email,
      "password": password,
      "role": role
    });

    if (response.statusCode == 200) {
      var responseString = response.body;

      return signUpResponseFromJson(responseString);
    } else {
      return null;
    }
  }

  //profile
  Future<ProfileResponse> profile() async {
    var apiUrl = baseUrl + '/user/profile';
    var token = '';

    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString(sharedPreferencesManager.KEY_TOKEN);

    var response = await http.get(apiUrl, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': '$token',
    });

    if (response.statusCode == 200) {
      var responseString = response.body;

      return profileResponseFromJson(responseString);
    } else {
      return null;
    }
  }

  //gallery design
  Future<GalleryDesignResponse> galleryDesign() async {
    var apiUrl = baseUrl + '/post';
    var token = '';

    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString(sharedPreferencesManager.KEY_TOKEN);

    var response = await http.get(apiUrl, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': '$token',
    });

    if (response.statusCode == 200) {
      var responseString = response.body;

      print(responseString);

      return galleryDesignResponseFromJson(responseString);
    } else {
      return null;
    }
  }

  //profile
  // Future<List<CustomerResponse>> profile() async {
  //   var apiUrl = baseUrl + '/ar/customer?bulan=$bulan&tahun=$tahun';
  //   var token = '';
  //
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   token = prefs.getString(sharedPreferencesManager.KEY_TOKEN);
  //
  //   // print('apiUrl ' + apiUrl);
  //
  //   var response = await http.get(apiUrl, headers: {
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //     'Authorization': '$token',
  //   });
  //
  //   if (response.statusCode == 200) {
  //     var responseString = response.body;
  //
  //     return customerResponseFromJson(responseString);
  //   } else {
  //     return null;
  //   }
  // }

}
