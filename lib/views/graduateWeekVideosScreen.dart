import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus_app/utilities/appColors.dart';
import 'package:graduate_plus_app/widgets/listViewCardWidget.dart';

class GraduateWeekVideosScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(CupertinoIcons.back, color: blackColor),
          onPressed: () {}, // TODO: Implement back navigation
        ),
        titleSpacing: 0,
        title: Image.asset('assets/images/bcuLogo.png', height: 40.0),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Section - Displays a promotional image
            Card(
              elevation: 4,
              margin: EdgeInsets.all(0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  'assets/images/bcuFreelancingCourse.png',
                  width: double.infinity,
                  height: 160,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16.0),

            // Title Section - Displays the page title
            Center(
              child: Text(
                "Videos",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: appThemeColor,
                ),
              ),
            ),
            SizedBox(height: 8.0),

            // Description - Provides context for the videos section
            Text(
              "These are all the videos from the Grad+ weeks in the past.",
              style: TextStyle(fontSize: 14.0, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build section titles
  Widget _buildSectionTitle(String title, String subTitle) {
    return Column(
      children: [
        title == ""
            ? SizedBox()
            : Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: appThemeColor,
              ),
            ),
        subTitle == ""
            ? SizedBox()
            : Text(
              subTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: blackColor,
              ),
            ),
        SizedBox(height: 4),
      ],
    );
  }

  // Helper function to build a list of event video cards
  Widget _buildGridView(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 4,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ListViewCardWidget(
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
        );
      },
    );
  }
}
