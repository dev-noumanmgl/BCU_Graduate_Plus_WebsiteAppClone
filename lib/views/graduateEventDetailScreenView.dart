import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus_app/utilities/appColors.dart';
import 'package:graduate_plus_app/utilities/textStyles.dart';
import 'package:graduate_plus_app/widgets/listViewCardWidget.dart';

class Graduateeventdetailscreenview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth =
        MediaQuery.of(
          context,
        ).size.width; // Get screen width for responsiveness

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

            // University & Interaction Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // University Logo and Name
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100), // Circular logo
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
                // Interaction Buttons (Like, Save, Download, Share)
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
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.0),

            // Event Description
            Text(
              "Graduate+ Week is a fantastic opportunity for you to develop as more well-rounded students...",
              style: TextStyle(fontSize: 16.0, color: Colors.black87),
            ),
            SizedBox(height: 16.0),
            Text(
              "If you haven’t come across the programme, this is an ideal opportunity to engage with BCU’s extra and co-curricular awards...",
              style: TextStyle(fontSize: 16.0, color: Colors.black87),
            ),
            SizedBox(height: 16.0),

            ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
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
            ),
          ],
        ),
      ),
    );
  }
}
