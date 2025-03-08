import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus_app/utilities/appColors.dart';

class UploadedPostDetailsScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(CupertinoIcons.back, color: blackColor),
          onPressed: () {},
        ),
        titleSpacing: 0,
        title: Row(
          children: [Image.asset('assets/images/bcuLogo.png', height: 40.0)],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Post Header with Thumbnail and Author
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      'assets/images/coverPic.png',
                      width: double.infinity,
                      height: 200.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                        color: blackColor.withOpacity(.7),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Posted by:",
                            style: TextStyle(color: whiteColor),
                          ),
                          Text(
                            'Pardeep Singh',
                            style: TextStyle(
                              color: whiteColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),

              // Post Title
              Text(
                'Action for Happiness',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              SizedBox(height: 8.0),

              // Post Description
              Text(
                'We all deserve the chance to be happy.\n\nThe cost of living is a big challenge right now. Here at Action for Happiness we want to make the life-changing science of happiness available to everyone.',
                style: TextStyle(fontSize: 16.0, color: Colors.black87),
              ),
              SizedBox(height: 16.0),

              // Post Additional Content
              Text(
                'The course near you in Dudley run by Jane & Julie is starting on Wednesday Mar 20, 7:00 PM and will run online on Zoom at the same day and time each week for 2 hours.\n\nJoin the course here:',
                style: TextStyle(fontSize: 16.0, color: Colors.black87),
              ),
              InkWell(
                onTap: () {}, // Add link functionality here
                child: Text(
                  'https://actionforhappiness.org/course/happiness-habits-dudley',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    fontSize: 16.0,
                  ),
                ),
              ),
              SizedBox(height: 16.0),

              // File Thumbnail
              Container(
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Row(
                  children: [
                    Icon(Icons.picture_as_pdf, color: appThemeColor, size: 40),
                    SizedBox(width: 12.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Happiness Habits.pdf',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            'PDF Document',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.download, color: appThemeColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
