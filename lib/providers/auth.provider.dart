import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthProvider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool val) {
    _loading = val;
    notifyListeners();
  }

  login(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    setLoading(true);
    try {
      Response loginResponse = await post(
        Uri.parse(
            'https://asia-southeast1-abidtkg-ef77b.cloudfunctions.net/jsengine/auth/login'),
        body: {"email": email, "password": password},
      );

      setLoading(false);
      if (loginResponse.statusCode == 200) {
        var responseBody = json.decode(loginResponse.body);
        await prefs.setString('token', responseBody['token']);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      setLoading(false);
      return false;
    }
  }

  getAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    if (token != null) {
      return token;
    } else {
      return null;
    }
  }
}
