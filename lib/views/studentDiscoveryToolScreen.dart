import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus_app/utilities/appColors.dart';
import 'package:graduate_plus_app/views/feedbackDiscoveryToolScreenView.dart';
import 'package:graduate_plus_app/views/q_rDiscoveryToolScreenView.dart';
import 'package:graduate_plus_app/views/r_b_sDiscoveryToolScreen.dart';
import 'package:graduate_plus_app/widgets/listViewCardWidget.dart';

class StudentDiscoveryToolScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsive design
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header image
              Card(
                elevation: 4,
                margin: EdgeInsets.all(0),
                child: Container(
                  width: screenWidth,
                  height: 79,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage('assets/images/bcuDTFS.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              // Introduction text
              Text(
                'Welcome to the Jisc discovery tool',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: blackColor,
                ),
              ),
              SizedBox(height: 8.0),
              // Instructions for students
              Text(
                '1. Start your journey by selecting the question sets and reports panel. Your personalised report will appear when you complete a question set.',
                style: TextStyle(
                  fontSize: 14.0,
                  color: blackColor.withOpacity(0.7),
                ),
              ),
              SizedBox(height: 4.0),
              Text(
                '2. Next, use the resource bank to search for and access resources that will aid your digital development.',
                style: TextStyle(
                  fontSize: 14.0,
                  color: blackColor.withOpacity(0.7),
                ),
              ),
              SizedBox(height: 4.0),
              Text(
                '3. To re-visit your personalised reports, select the question sets and reports panel. You will be able to access your report within each question set.',
                style: TextStyle(
                  fontSize: 14.0,
                  color: blackColor.withOpacity(0.7),
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'If you need any help, please take a look at our guidance for students and staff.',
                style: TextStyle(
                  fontSize: 14.0,
                  color: blackColor.withOpacity(0.7),
                ),
              ),
              SizedBox(height: 16.0),
              // ListView with question sets and reports
              ListView.builder(
                shrinkWrap: true, // Ensures proper scrolling within Column
                itemCount: 6, // Number of list items
                physics:
                    NeverScrollableScrollPhysics(), // Disables ListView scrolling
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      switch (index) {
                        case 0:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => QR_DC_DiscoveryToolScreenView(
                                    qrDiscoveryScreen: true,
                                  ),
                            ),
                          );
                          break;
                        case 1:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => RBSDiscoveryToolScreenView(),
                            ),
                          );
                          break;
                        case 2:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => QR_DC_DiscoveryToolScreenView(
                                    qrDiscoveryScreen: false,
                                  ),
                            ),
                          );
                          break;
                        case 3:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) =>
                                      FeedbackDiscoveryToolScreenView(),
                            ),
                          );
                          break;
                      }
                    },
                    child: ListViewCardWidget(
                      imagePath:
                          'assets/images/bcuFB.png', // Image for list item
                      title:
                          index % 2 ==
                                  0 // Alternating titles for list items
                              ? 'Question sets and reports for students'
                              : 'Give feedback - it only takes 2 minutes',
                      likes: 213, // Number of likes (static for now)
                      isBookmark: true, // Bookmark icon enabled
                      isLiked: true, // Like icon enabled
                      description:
                          'Some of the most vivid and effective descriptive writing in music can be found in rap', // Static description
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
