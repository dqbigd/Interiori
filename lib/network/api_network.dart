import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:interiori/model/login_model.dart';
import 'package:interiori/utils/shared_preferences_manager.dart';

class ApiNetwork {
  SharedPreferencesManager sharedPreferencesManager =
      SharedPreferencesManager();

  final String baseUrl = 'https://d48b60241ade.ngrok.io';

  //login
  // Future<LoginResponse> login(String username, String password) async {
  //   var apiUrl = baseUrl + '/ar/login';
  //
  //   var response = await http
  //       .post(apiUrl, body: {"username": username, "password": password});
  //
  //   if (response.statusCode == 200) {
  //     var responseString = response.body;
  //
  //     return loginResponseFromJson(responseString);
  //   } else if (response.statusCode == 401) {
  //     Get.snackbar('Unauthorized', 'Username or password invalid',
  //         snackPosition: SnackPosition.BOTTOM,
  //         margin: EdgeInsets.only(bottom: 5));
  //   } else {
  //     return null;
  //   }
  // }

//login
  Future<SignUpResponse> signUp(
      String fullname, String username, String email, String password) async {
    var apiUrl = baseUrl + '/auth/signup';

    var response = await http.post(apiUrl, body: {
      "fullname": fullname,
      "username": username,
      "email": email,
      "password": password
    });

    if (response.statusCode == 200) {
      var responseString = response.body;
      var responsefromJson = signUpResponseFromJson(responseString);

      if (responsefromJson.code == '00' &&
          responsefromJson.message == 'Found.') {
        Get.snackbar('Oops', 'Username already taken',
            snackPosition: SnackPosition.BOTTOM,
            margin: EdgeInsets.only(bottom: 5));
        return null;
      } else if (responsefromJson.code == '00' &&
          responsefromJson.message == 'Ok.') {
        return signUpResponseFromJson(responseString);
      }
    } else {
      return null;
    }
  }

  //new customer data
  // Future<List<CustomerResponse>> newCustomerData(
  //     String bulan, String tahun) async {
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
  //     'Authorization': 'Bearer $token',
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
