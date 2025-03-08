import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus_app/utilities/appColors.dart';
import 'package:graduate_plus_app/views/graduateWeekEventDetailScreen.dart';
import 'package:graduate_plus_app/widgets/listViewCardWidget.dart';

class GraduateWeekEventsScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(CupertinoIcons.back, color: blackColor),
          onPressed: () {}, // Add navigation logic here
        ),
        titleSpacing: 0,
        title: Image.asset('assets/images/bcuLogo.png', height: 40.0),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Section
            Center(
              child: Text(
                "GRADUATE+ WEEK (November 4th - 8th)",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: appThemeColor,
                ),
              ),
            ),
            SizedBox(height: 8.0),

            // Description Section
            Text(
              "Our full programme for the upcoming Graduate+ week is out now!",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              "Graduate+ Week is a fantastic opportunity for you to develop as more well-rounded students...",
              style: TextStyle(fontSize: 14.0, color: Colors.black87),
            ),
            SizedBox(height: 16.0),

            // List of Events
            ListView.builder(
              shrinkWrap: true,
              itemCount: 4, // Adjust number of events
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => GraduateWeekEventDetailScreenView(),
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
            SizedBox(height: 16.0),

            // Suggested Events by Course Section
            _buildSectionTitle(
              "Suggested Graduate+ Week Events by Course",
              "Arts, Design, and Media Courses",
            ),
            _buildGridView(context),

            SizedBox(height: 24.0),

            // Suggested Events by Area of Development Section
            _buildSectionTitle("", "Business, Law and Social Sciences Courses"),
            _buildGridView(context),
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

  // Helper function to build a grid view for events
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
