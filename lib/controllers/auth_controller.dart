import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mac_store_app_flutter/global_variable.dart';
import 'package:mac_store_app_flutter/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:mac_store_app_flutter/services/manage_http_response.dart';
import 'package:mac_store_app_flutter/views/screens/authentication/login_screen.dart';
import 'package:mac_store_app_flutter/views/screens/main_screen.dart';

class AuthController {
  Future<void> signUpUsers({
    required context,
    required String email,
    required String fullName,
    required String password,
  }) async {
    try {
      User user = User(
          id: "",
          fullName: fullName,
          email: email,
          state: "",
          city: "",
          locality: "",
          password: password,
          token: "");
      http.Response response = await http.post(Uri.parse("$uri/api/signup"),
          body: user.toJson(),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8",
          });
      manageHttpResponse(
          response: response,
          context: context,
          onSuccess: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
            showSnackBar(context, "حساب کاربری شما ساخته شد");
          });
    } catch (e) {}
  }

  Future<void> signInUsers(
      {required context,
      required String email,
      required String password}) async {
    try {
      http.Response response = await http.post(Uri.parse("$uri/api/signin"),
          body: jsonEncode({'email': email, 'password': password}),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8",
          });

      manageHttpResponse(
          response: response,
          context: context,
          onSuccess: () {
             Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) => MainScreen()),(route)=>false);
            showSnackBar(context, "ورود موفیقت آمیز بود");
          });
    } catch (e) {
      print("error : $e");
    }
  }
}
