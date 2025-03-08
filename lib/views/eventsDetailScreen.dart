import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus_app/utilities/appColors.dart';
import 'package:graduate_plus_app/utilities/textStyles.dart';

class EventsDetailScreenView extends StatelessWidget {
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
            // Event Cover Image
            Card(
              elevation: 4,
              margin: EdgeInsets.all(0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  'assets/images/coverPic.png',
                  width: double.infinity,
                  height: 160.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 8.0),

            // Event Title
            Text(
              'Bronze Award: Event',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),

            // Location Information
            Row(
              children: [
                Icon(Icons.location_on_rounded),
                SizedBox(width: 4),
                Text(
                  "Curzon Building Room C423",
                  style: textStyleBold(blackColor),
                ),
              ],
            ),
            SizedBox(height: 8.0),

            // Date and Time Information
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.calendar_month),
                    SizedBox(width: 4),
                    Text(
                      "SEP 20, 2024 21:00",
                      style: textStyleBold(blackColor),
                    ),
                  ],
                ),

                // Event Interaction Icons (Likes, Bookmark, Download)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
              "Birmingham City University is committed to protect and manage its environmental impacts through an Environmental Management System (EMS) certified to the ISO 14001:2015 standard. We also achieved EcoCampus Platinum status in 2013, and at the time, were one of only 10 universities to do so. An EMS is the management of environmental programmes in a systematic, planned and documented matter, encouraging continual improvement. Our EMS scope covers the provision of teaching, research, commercial facilities and supporting activities within our Birmingham campus locations. As part of the EMS, we conduct regular internal audits, have annual external audits and an annual peer-review, to ensure that we continue to improve our environmental performance.",
              style: TextStyle(fontSize: 16.0, color: Colors.black87),
            ),
            SizedBox(height: 16.0),

            // Additional Details about the Event
            Text(
              "Environmental Reports:"
              "Progress against the Environmental Plan, our Objectives and Targets and other key policies, plans and strategies is captured in our annual Environmental Report, which is reported to the Board of Governors each year."
              "2022/23 Environmental Report"
              "2021/22 Environmental Report"
              "2020/21 Environmental Report"
              "2019/20 Environmental Report"
              "2019 Environmental Report"
              "2018 Environmental Report",
              style: TextStyle(fontSize: 16.0, color: Colors.black87),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
