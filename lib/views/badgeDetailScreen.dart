import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus_app/utilities/appColors.dart';

/// A stateless widget that represents the Badge Detail Screen.
/// This screen displays a badge awarded to a user, along with details such as
/// the recipient's name, date received, and a description of the award.
class BadgeDetailScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the screen width for responsive UI adjustments if needed.
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // AppBar with a transparent background and a back button
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipOval(
            child: Container(
              height: 44,
              width: 44,
              color: blackColor.withOpacity(.7),
              child: Center(
                child: Icon(Icons.arrow_back_rounded, color: whiteColor),
              ),
            ),
          ),
        ),
      ),
      extendBodyBehindAppBar:
          true, // Allows the background image to extend behind the AppBar

      body: Stack(
        children: [
          // Background image covering the entire screen
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/backgroundPic.png',
                ), // Replace with your background image
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Centered Card containing badge details
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8.0,
                    offset: Offset(0, 4), // Adds shadow for a lifted effect
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Adjusts size based on content
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Share button at the top-right corner of the card
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      onPressed: () {
                        // Handle share action (to be implemented)
                      },
                      icon: Icon(Icons.share),
                    ),
                  ),

                  // University Logo
                  Image.asset('assets/images/bcuLogo.png', height: 60.0),
                  SizedBox(height: 16.0),

                  // User Name
                  Text(
                    'Pardeep Singh',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 4.0),

                  // Date the badge was awarded
                  Text(
                    'SEP 20, 2024',
                    style: TextStyle(fontSize: 14.0, color: Colors.grey),
                  ),
                  SizedBox(height: 16.0),

                  // Badge Image
                  Image.asset(
                    'assets/images/bcuBronzeAward.png', // Replace with actual badge image
                    height: 150.0,
                  ),
                  SizedBox(height: 16.0),

                  // Badge Title
                  Text(
                    'Bronze Award - BCU Graduate+',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 8.0),

                  // Badge Description
                  Text(
                    'Graduate Plus Bronze Award for engaging in Extracurricular Activities',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.0, color: Colors.black87),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
