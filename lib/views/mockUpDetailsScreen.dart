import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus_app/utilities/appColors.dart';
import 'package:graduate_plus_app/utilities/textStyles.dart';

class MockUpDetailsScreenView extends StatelessWidget {
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
            // Title Section
            Text(
              'Assessment Centre',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
            ),
            SizedBox(height: 8.0),

            // Row containing BCU logo and icons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
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

                // Icons Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.heart,
                      size: 22.0,
                      color: blackColor,
                    ), // TODO: Implement like functionality
                    SizedBox(width: 16.0),
                    Icon(
                      CupertinoIcons.arrow_down_to_line,
                      size: 20.0,
                      color: blackColor,
                    ), // TODO: Implement download functionality
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.0),

            // Description Section
            Text(
              "Students often assume that you can't prepare for assessment centres but there are different ways you can prepare. If you manage to complete one of the following activities below, you will have completed this part of the activity overall.",
              style: TextStyle(fontSize: 16.0, color: Colors.black87),
            ),
            SizedBox(height: 8.0),

            // List of activities
            Text(
              "- Complete 1 Assessment Centre Exercise on Graduates First. Click Here to complete the exercise\n- Book a Careers Plus appointment to run through how an assessment centre works. Click Here to book an appointment\n- Watch 6 videos on Assessment centres from the 'Understanding assessments' section on the Graduate+ website. See links below",
              style: TextStyle(fontSize: 16.0, color: Colors.black87),
            ),
            SizedBox(height: 16.0),

            // Links Section
            Text(
              'Direct links to the above videos:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            SizedBox(height: 8.0),

            // Generating multiple clickable links dynamically
            ...List.generate(
              10,
              (index) => InkWell(
                onTap: () {}, // TODO: Implement link navigation
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    '• Link $index: Description of the link',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14.0,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),

            // Image Section
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                'assets/images/bcuAssesment Centre.png',
                width: screenWidth,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16.0),

            // Reflection Section
            Text(
              'Reflect on your experience of learning about assessment centres and completing activities',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              '0 / 200 words',
              style: TextStyle(fontSize: 14.0, color: Colors.grey),
            ),
            SizedBox(height: 8.0),

            // TextField for reflection input
            Container(
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Type here...',
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
