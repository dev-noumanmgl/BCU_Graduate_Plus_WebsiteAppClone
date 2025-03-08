import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus_app/utilities/appColors.dart';
import 'package:graduate_plus_app/utilities/textStyles.dart';
import 'package:graduate_plus_app/views/graduateEventDetailScreenView.dart';
import 'package:graduate_plus_app/widgets/listViewCardWidget.dart';

class GraduateWeekEventDetailScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
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

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event Title
            Text(
              'Building and Construction Management',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),

            // University Info Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // University Logo and Name
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: whiteColor,
                          border: Border.all(color: blackColor),
                        ),
                        child: Center(
                          child: Image.asset(
                            "assets/images/bcuLogo1.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text("BCU", style: textStyleBold(blackColor)),
                  ],
                ),

                // Interaction Icons (Likes, Bookmark, Download, Share)
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.heart_fill,
                      size: 22.0,
                      color: appThemeColor,
                    ),
                    SizedBox(width: 4.0),
                    Text('592'),
                    SizedBox(width: 16.0),
                    Icon(
                      CupertinoIcons.bookmark,
                      size: 18.0,
                      color: appThemeColor,
                    ),
                    SizedBox(width: 16.0),
                    Icon(
                      CupertinoIcons.arrow_down_to_line,
                      size: 20.0,
                      color: Colors.black,
                    ),
                    SizedBox(width: 16.0),
                    Icon(CupertinoIcons.share, size: 20.0, color: Colors.black),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.0),

            // Event Description
            Text(
              "Graduate+ Week is a fantastic opportunity for you to develop as more well-rounded students. Across the week, across both campuses and online, explore an exciting range of activities that will expand your horizons, develop your skills, and complete your student experience!",
              style: TextStyle(fontSize: 16.0, color: Colors.black87),
            ),
            SizedBox(height: 16.0),
            Text(
              "If you haven’t come across the programme, this is an ideal opportunity to engage with BCU’s extra and co-curricular awards. Academics, across all courses, will be encouraging you to engage with the activities we have on offer that cover the gamut of experiences such as: developing your academic skills with courses offered by the Centre for Academic Success with sessions on academic writing, critical thinking, referencing and more; improving your employability with sessions offered by the careers team that will help you to know how to talk to employers, or explore volunteering and mentoring opportunities.",
              style: TextStyle(fontSize: 16.0, color: Colors.black87),
            ),
            SizedBox(height: 16.0),

            // Activities Scheduled for Each Day
            ..._buildDaySections(),
          ],
        ),
      ),
    );
  }

  // Builds the event schedule for each day of the week
  List<Widget> _buildDaySections() {
    final days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];

    return days
        .map(
          (day) => Column(
            children: [
              SizedBox(height: 16.0),
              // Day Heading
              Text(
                day,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: appThemeColor,
                ),
              ),
              SizedBox(height: 8.0),
              // List of activities for the day
              ListView.builder(
                shrinkWrap: true,
                itemCount: 4, // TODO: Update dynamically based on actual data
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Graduateeventdetailscreenview(),
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
        )
        .toList();
  }
}
