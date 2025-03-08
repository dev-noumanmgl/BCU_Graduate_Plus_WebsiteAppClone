// Import necessary Flutter packages for UI components
import 'package:flutter/cupertino.dart'; // Provides iOS-style widgets
import 'package:flutter/material.dart'; // Core Flutter UI components

// Import custom utilities for colors, text styles, and widgets
import 'package:graduate_plus_app/utilities/appColors.dart';
import 'package:graduate_plus_app/utilities/textStyles.dart';
import 'package:graduate_plus_app/views/courseFeedbackDetailScreenView.dart';
import 'package:graduate_plus_app/widgets/listViewCardWidget.dart'; // Custom widget for displaying grid items

// Main screen for the RBS Discovery Tool, which presents a categorized list of digital resources
class Coursedetailsscreenview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size =
        MediaQuery.of(context).size; // Get screen size for responsive layout

    return Scaffold(
      // App Bar with a back button and a logo
      appBar: AppBar(
        backgroundColor:
            Colors.transparent, // Transparent to blend with the design
        elevation: 0, // Remove shadow for a cleaner look
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.back,
            color: blackColor,
          ), // Back button icon
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous screen
          },
        ),
        titleSpacing: 0, // Align title with the leading icon
        title: Image.asset(
          'assets/images/bcuLogo.png', // Display BCU logo
          height: 40.0,
        ),
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
              // Header Image
              Card(
                elevation: 4,
                margin: EdgeInsets.all(0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    12.0,
                  ), // Rounded corners for aesthetics
                  child: Image.asset(
                    'assets/images/bcuBanner.png', // Replace with header image
                    width: double.infinity,
                    fit: BoxFit.cover, // Ensures the image covers the width
                  ),
                ),
              ),
              SizedBox(height: 16.0), // Add spacing below the banner
              // Title Section - Displays the main heading of the page
              Text(
                'Freelancers\' Fair 2024', // Page title
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
                        color: appThemeColor,
                      ), // Like icon
                      SizedBox(width: 4.0),
                      Text('592'), // Like count

                      SizedBox(width: 16.0),
                      Icon(
                        CupertinoIcons.bookmark_fill,
                        size: 18.0,
                        color: appThemeColor,
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
                'The Freelancers\' Fair happens during Grad+ Week (Week 7). It provides a week-long series of activities that help students with employability. We invite alumni who are working in the industry, and industry specialists to provide advice and workshops mainly for students who are studying film (or \'screen’ production – VFX students).\n This playlist includes all the activities that you could do as part of this week.',
                style: TextStyle(fontSize: 14.0, color: Colors.grey.shade600),
              ),
              SizedBox(height: 16.0), // Space before listing sections

              ListView.builder(
                shrinkWrap: true, // Ensures it fits within the scroll view
                itemCount: 4, // Number of items
                physics:
                    NeverScrollableScrollPhysics(), // Disables inner scrolling
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => Coursefeedbackdetailscreenview(),
                        ),
                      );
                    },
                    child: ListViewCardWidget(
                      imagePath: 'assets/images/bcuFB.png',
                      title:
                          index % 2 == 0
                              ? 'Question sets and reports for students'
                              : 'Give feedback - it only takes 2 minutes',
                      likes: 213,
                      isBookmark: true,
                      isLiked: true,
                      description:
                          'Some of the most vivid and effective descriptive writing in music can be found in rap',
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
