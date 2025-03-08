import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus_app/utilities/appColors.dart'; // Importing custom colors
import 'package:graduate_plus_app/views/courseDetailsScreenView.dart';
import 'package:graduate_plus_app/widgets/listViewCardWidget.dart'; // Importing a reusable ListView card widget

/// A stateless widget representing the Embedded Courses screen.
/// Displays a list of award-related activities and a suggested playlist.
class EmbeddedCoursesScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Transparent AppBar with a back button and logo
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

      // Scrollable body to accommodate content dynamically
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align content to the left
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
            SizedBox(height: 16.0),

            // Title Section
            Text(
              'Course Module Award Activities',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Specific award activities relevant to your degree programme and modules can be found below.',
              style: TextStyle(fontSize: 16.0, color: Colors.black87),
            ),
            SizedBox(height: 16.0),

            // List of award activities using ListView.builder
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
                        builder: (context) => Coursedetailsscreenview(),
                      ),
                    );
                  },
                  child: ListViewCardWidget(
                    imagePath: 'assets/images/bcuFB.png',
                    title:
                        index % 2 == 0
                            ? 'Question sets and reports for students'
                            : 'Give feedback - it only takes 2 minutes',
                    likes: 213, // Static like count
                    isBookmark: true, // Pre-set bookmark status
                    isLiked: true, // Pre-set like status
                    description:
                        'Some of the most vivid and effective descriptive writing in music can be found in rap',
                  ),
                );
              },
            ),
            SizedBox(height: 24.0),

            // Suggested Playlist Section
            Text(
              'Suggested Playlist',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.0),

            // List of suggested playlist items using ListView.builder
            ListView.builder(
              shrinkWrap: true, // Fits within the scroll view
              itemCount: 4, // Number of items
              physics:
                  NeverScrollableScrollPhysics(), // Prevents nested scrolling
              itemBuilder: (context, index) {
                return ListViewCardWidget(
                  imagePath: 'assets/images/bcuFB.png',
                  title:
                      index % 2 == 0
                          ? 'Question sets and reports for students'
                          : 'Give feedback - it only takes 2 minutes',
                  likes: 213, // Static like count
                  isBookmark: true, // Pre-set bookmark status
                  isLiked: true, // Pre-set like status
                  description:
                      'Some of the most vivid and effective descriptive writing in music can be found in rap',
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Helper function to build an award card widget.
  /// Displays an image, title, and like count.
  Widget _buildAwardCard(String title, int likes, String imagePath) {
    return Card(
      elevation: 4.0, // Slight elevation for shadow effect
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ), // Rounded corners
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Aligns text to the left
        children: [
          // Image with rounded top corners
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
            child: Image.asset(
              imagePath,
              height: 100.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title with ellipsis for overflow handling
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8.0),

                // Row for like icon and count
                Row(
                  children: [
                    Icon(Icons.thumb_up, size: 16.0, color: Colors.grey),
                    SizedBox(width: 4.0),
                    Text(
                      likes.toString(),
                      style: TextStyle(fontSize: 14.0, color: Colors.black87),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
