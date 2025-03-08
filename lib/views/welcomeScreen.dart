import 'package:flutter/material.dart'; // Importing Flutter Material package for UI components
import 'package:graduate_plus_app/utilities/appColors.dart'; // Importing custom app colors
import 'package:graduate_plus_app/utilities/commonButton.dart'; // Importing reusable button widget
import 'package:graduate_plus_app/views/signInScreen.dart'; // Importing Sign-In screen

// Stateless widget for the Welcome Screen
class WelcomeScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Using Stack to layer widgets on top of each other
      body: Stack(
        children: [
          // Background Image (fills entire screen)
          Positioned.fill(
            child: Image.asset(
              'assets/images/backgroundPic.png', // Background image asset
              fit: BoxFit.cover, // Cover entire screen
            ),
          ),

          // Foreground Content
          Padding(
            padding: const EdgeInsets.all(
              16,
            ), // Padding around the main content
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: whiteColor, // White background for contrast
                  borderRadius: BorderRadius.circular(
                    16,
                  ), // Rounded corners for better UI
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Minimize column height
                  children: [
                    // Spacing at the top
                    SizedBox(height: MediaQuery.of(context).size.height / 20),

                    // Logo Image
                    Image.asset(
                      'assets/images/bcuLogo.png', // Logo image asset
                      height: 100, // Fixed height for logo
                    ),

                    // Spacing before buttons
                    SizedBox(height: MediaQuery.of(context).size.height / 7),

                    // Login Button
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                      ), // Padding for button
                      child: GestureDetector(
                        onTap: () {
                          // Navigate to Sign-In Screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignInScreenView(),
                            ),
                          );
                        },
                        child: commonButton(
                          context: context,
                          label: "LOGIN",
                        ), // Reusable button widget
                      ),
                    ),

                    SizedBox(height: 20), // Spacing between buttons
                    // "I'm a Graduate" Button (No action defined yet)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                      ), // Padding for button
                      child: commonButton(
                        context: context,
                        label: "I'M A GRADUATE",
                      ),
                    ),

                    // Spacing at the bottom
                    SizedBox(height: MediaQuery.of(context).size.height / 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
