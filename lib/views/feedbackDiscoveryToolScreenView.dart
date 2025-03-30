// Import necessary Flutter packages for UI components
import 'package:flutter/cupertino.dart'; // Provides iOS-style widgets
import 'package:flutter/material.dart'; // Core Flutter UI components

// Import custom utilities for colors, text styles, and widgets
import 'package:graduate_plus_app/utilities/appColors.dart';
import 'package:graduate_plus_app/utilities/textStyles.dart'; // Custom widget for displaying grid items

// Main screen for the RBS Discovery Tool, which presents a categorized list of digital resources
class FeedbackDiscoveryToolScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size =
        MediaQuery.of(context).size; // Get screen size for responsive layout

    return Scaffold(
      // App Bar with a back button and a logo
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
        titleSpacing: 0,
        title: Image.asset('assets/images/bcuLogo.png', height: 60.0),
      ),

      // Main body wrapped in a scrollable view
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ), // Add horizontal padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Banner Section - Displays an image at the top
              Card(
                elevation: 4,
                margin: EdgeInsets.all(0),
                child: Container(
                  height: 79, // Fixed height for the banner
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/bcuFB.png',
                      ), // Background image
                      fit: BoxFit.cover, // Ensures image fits without cropping
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0), // Add spacing below the banner
              // Title Section - Displays the main heading of the page
              Text(
                'Give feedback - it only takes 2 minutes', // Page title
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8), // Space between title and profile section
              // Profile & Interaction Row - Shows author and interaction buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Profile Picture and Author Name
                  Row(
                    children: [
                      // Circular Profile Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                          100,
                        ), // Rounded image
                        child: Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                            border: Border.all(
                              color: blackColor,
                            ), // Black border around the image
                          ),
                          child: Center(
                            child: Image.asset(
                              "assets/images/bcuLogo1.png", // Profile image
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8), // Space between image and text
                      Text(
                        "Jisc", // Author/Organization name
                        style: textStyleBold(blackColor),
                      ),
                    ],
                  ),

                  // Interaction Icons (Likes, Bookmark, Download, Share)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.heart_fill,
                        size: 22.0,
                        color: blackColor,
                      ), // Like icon
                      SizedBox(width: 4.0),
                      Text('592'), // Like count

                      SizedBox(width: 16.0),
                      Icon(
                        CupertinoIcons.bookmark_fill,
                        size: 18.0,
                        color: blackColor,
                      ), // Bookmark icon

                      SizedBox(width: 16.0),
                      Icon(
                        CupertinoIcons.arrow_down_to_line,
                        size: 20.0,
                        color: Colors.black,
                      ), // Download icon

                      SizedBox(width: 16.0),
                      Icon(
                        CupertinoIcons.share,
                        size: 20.0,
                        color: Colors.black,
                      ), // Share icon
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.0), // Space below the profile section
              // Description Section - Provides an overview of the available resources
              Text(
                'Give feedback: help make it better'
                'Please tell us what you thought of your use of the discovery tool so we can make it better for future users.'
                'There are just 10 questions that focus on ease of use and usefulness. The survey should only take around two minutes to complete. We really appreciate all your feedback.'
                'All questions are optional. Thanks for sharing your opinions with us.\n'
                'The Jisc building digital capability team\n'
                'Please click here to answer the questions.',
                style: TextStyle(fontSize: 14.0, color: Colors.grey.shade600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
