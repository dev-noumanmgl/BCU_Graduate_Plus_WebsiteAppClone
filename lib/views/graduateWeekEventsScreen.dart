import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus_app/utilities/appColors.dart';
import 'package:graduate_plus_app/utilities/services/dataService.dart';
import 'package:graduate_plus_app/views/graduateWeekEventDetailScreen.dart';
import 'package:graduate_plus_app/widgets/eventsListViewCardWidget.dart';
import 'package:graduate_plus_app/widgets/listViewCardWidget.dart';

class GraduateWeekEventsScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            EventsListViewCardWidgets(
              hasLogo: true,
              postedBy: '',
              nextScreen: '',
              postedDate: '',
              events: DataService.fetchSingleIntroEvent(),
            ),
            SizedBox(height: 16.0),

            // Suggested Events by Course Section
            _buildSectionTitle(
              "Suggested Graduate+ Week Events by Course",
              "Arts, Design, and Media Courses",
            ),
            EventsListViewCardWidgets(
              hasLogo: true,
              postedBy: '',
              nextScreen: 'detail',
              postedDate: '',
              events: DataService.fetchArtEvents(),
            ),

            SizedBox(height: 24.0),

            // Suggested Events by Area of Development Section
            _buildSectionTitle("", "Business, Law and Social Sciences Courses"),
            EventsListViewCardWidgets(
              hasLogo: true,
              postedBy: '',
              nextScreen: 'detail',
              postedDate: '',
              events: DataService.fetchArtEvents(),
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
}
