import 'package:flutter/material.dart';
import 'package:graduate_plus_app/utilities/appColors.dart'; // Importing app-specific colors
import 'package:graduate_plus_app/views/splashScreen.dart'; // Importing the splash screen

// Main function - Entry point of the Flutter application
void main() {
  runApp(const MyApp());
}

// MyApp widget - Root of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Graduate Plus App', // Application title
      debugShowCheckedModeBanner: false, // Hides debug banner in debug mode
      theme: ThemeData(
        // Defining the app's theme using a primary color scheme
        colorScheme: ColorScheme.fromSeed(seedColor: appThemeColor),
      ),
      home: SplashScreenView(), // Setting SplashScreen as the initial screen
    );
  }
}
