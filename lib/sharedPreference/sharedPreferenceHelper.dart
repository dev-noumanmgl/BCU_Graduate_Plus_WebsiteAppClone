import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrenceHelper {
  static String userIdKey = 'USERIDKEY';
  static String userNameKey = 'USERNAMEKEY';
  static String usserMailKey = 'USEREMAILKEY';
  static String userPicKey = 'USERPICKEY';
  static String displayNameKey = 'DISPLAYNAMEKEY';
  static String isAccountCreated = 'ACCOUNTCREATEDKEY';

  Future<bool> saveUserId(String getUserId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userIdKey, getUserId);
  }

  Future<bool> saveUserEmail(String getUserEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(usserMailKey, getUserEmail);
  }

  Future<bool> saveUserPic(String getUserPic) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userPicKey, getUserPic);
  }

  Future<bool> saveDisplayName(String getDisplayName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(displayNameKey, getDisplayName);
  }

  Future<bool> saveAccountCreatedStatus(String accountCreated) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(isAccountCreated, accountCreated);
  }

  Future<String?> getgetAccountCreatedStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(isAccountCreated).toString().trim();
  }

  Future<String?> getDisplayName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(displayNameKey.toString().trim());
  }

  Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userIdKey).toString().trim();
  }

  Future<String?> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(usserMailKey).toString().trim();
  }

  Future<String?> getUserPic() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userPicKey).toString().trim();
  }
}
