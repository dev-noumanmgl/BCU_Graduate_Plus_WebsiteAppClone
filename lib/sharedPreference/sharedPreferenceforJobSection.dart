import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static const String keyName = "KEY_NAME";
  static const String keyEmail = "KEY_EMAIL";
  static const String keyLocation = "KEY_LOCATION";
  static const String keyJob = "KEY_JOB";
  static const String keyExperience = "KEY_EXPERIENCE";

  // Save personal info
  static Future<void> savePersonalInfo({
    required String name,
    required String email,
    required String location,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyName, name);
    await prefs.setString(keyEmail, email);
    await prefs.setString(keyLocation, location);
  }

  // Save professional info
  static Future<void> saveProfessionalInfo({
    required String jobTitle,
    required String experience,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyJob, jobTitle);
    await prefs.setString(keyExperience, experience);
  }

  // Get name
  static Future<String?> getName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyName);
  }

  // Get email
  static Future<String?> getEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyEmail);
  }

  // Get location
  static Future<String?> getLocation() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyLocation);
  }

  // Get job title
  static Future<String?> getJob() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyJob);
  }

  // Get work experience
  static Future<String?> getExperience() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyExperience);
  }

  // Clear personal and professional info (Optional utility)
  static Future<void> clearPersonalAndProfessionalInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(keyName);
    await prefs.remove(keyEmail);
    await prefs.remove(keyLocation);
    await prefs.remove(keyJob);
    await prefs.remove(keyExperience);
  }
}
