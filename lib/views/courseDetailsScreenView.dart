// Import necessary Flutter packages for UI components
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart'; // Provides iOS-style widgets
import 'package:flutter/material.dart'; // Core Flutter UI components

// Import custom utilities for colors, text styles, and widgets
import 'package:graduate_plus_app/utilities/appColors.dart';
import 'package:graduate_plus_app/utilities/models/courseModel.dart';
import 'package:graduate_plus_app/utilities/services/dataService.dart';
import 'package:graduate_plus_app/utilities/textStyles.dart';
import 'package:graduate_plus_app/views/courseFeedbackDetailScreenView.dart';
import 'package:graduate_plus_app/widgets/coursesListViewCardWidget.dart';
import 'package:graduate_plus_app/widgets/listViewCardWidget.dart'; // Custom widget for displaying grid items

// Main screen for the RBS Discovery Tool, which presents a categorized list of digital resources
class Coursedetailsscreenview extends StatelessWidget {
  final CoursesModel courses;
  const Coursedetailsscreenview({super.key, required this.courses});
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
              // Header Image
              Card(
                elevation: 4,
                margin: EdgeInsets.all(0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    12.0,
                  ), // Rounded corners for aesthetics
                  child: CachedNetworkImage(
                    imageUrl: courses.image,
                    height: 79,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CupertinoActivityIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
              SizedBox(height: 16.0), // Add spacing below the banner
              // Title Section - Displays the main heading of the page
              Text(
                courses.title, // Page title
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
                        courses.publiserName, // Author/Organization name
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
                        CupertinoIcons.heart,
                        size: 22.0,
                        color: blackColor,
                      ), // Like icon
                      SizedBox(width: 4.0),
                      Text(courses.like.toString()), // Like count

                      SizedBox(width: 16.0),
                      Icon(
                        CupertinoIcons.bookmark,
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
                courses.description.join("\n\n"),
                style: TextStyle(fontSize: 14.0, color: Colors.grey.shade600),
              ),
              SizedBox(height: 16.0), // Space before listing sections

              CoursesListViewCardWidget(
                hasLogo: true,
                postedBy: '',
                nextScreen: 'courseFeedback',
                postedDate: '',
                futureCourses: DataService.fetchCourses(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
