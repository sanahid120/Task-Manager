import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/Data/Services/user_model.dart';

class AuthControllers {
  static final String tokenKey = 'token';
  static final String userKey = 'user';
  static String? accessToken;
  static UserModel? userModelData;
  static Future<void> saveUserData(String token, UserModel userModel) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    await sharedPreferences.setString(tokenKey, token);
    await sharedPreferences.setString(userKey, jsonEncode(userModel.toJson()));
  }

  static Future<void> getUserData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    // String? userToken = sharedPreferences.getString(tokenKey);
    // String? userData = sharedPreferences.getString(userKey);
    if (sharedPreferences.getString(tokenKey) != null) {
      accessToken = sharedPreferences.getString(tokenKey);
      userModelData = UserModel.fromJson(
        jsonDecode(sharedPreferences.getString(userKey)!),
      );
    }
  }

  static Future<bool> isUserLoggedin() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(tokenKey);
    return token!=null;
  }

  static Future<bool> logOut() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
return sharedPreferences.clear();
  }
}
