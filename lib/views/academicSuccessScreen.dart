import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus_app/utilities/appColors.dart';
import 'package:graduate_plus_app/views/graduateWeekEventDetailScreen.dart';
import 'package:graduate_plus_app/widgets/listViewCardWidget.dart';

class AcademicSuccessScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App Bar
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

      // Body Content
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            Card(
              elevation: 4,
              margin: EdgeInsets.all(0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  'assets/images/bcuCAS.png',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),

            // Description Section
            Text(
              "The Centre for Academic Success is the University's central learning development service. Our aim is to help you develop all of the necessary academic, technical and numerical skills you need to progress and successfully complete your course.",
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16),

            // List of Services
            Text(
              "We can help with:",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "• Academic essay and report writing\n"
              "• English language for international students\n"
              "• Referencing\n"
              "• Dissertations\n"
              "• Improving your assignment drafts\n"
              "• Presentation skills\n"
              "• Maths and statistics\n"
              "• Computing and programming\n"
              "• Project management\n"
              "• Study skills",
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16),

            // Additional Resources Section
            Text(
              "Find out more...",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            // List of additional learning resources
            ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
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
            SizedBox(height: 16),

            // BCU Success Survey Section
            _buildHighlightCard(
              "BCU Success Survey",
              "This tool has been designed to help you explore your confidence and previous experiences in key areas that will feed into a positive and fulfilling university journey.",
              "Take the success survey",
              "assets/images/bcuSS.png",
            ),
            SizedBox(height: 16),

            // Success Course Online Section
            _buildHighlightCard(
              "Success Course Online",
              "The Success course has been created to help you develop your academic skills. Whether you are doing your first degree, or your Master's or PhD, we are here to provide support and information to help you achieve your full potential at Birmingham City University.",
              "Sign Up for the Success Course",
              "assets/images/bcuSCO.png",
            ),
          ],
        ),
      ),
    );
  }

  /// A reusable card widget displaying an image and a title.
  /// Useful for displaying features or categories in a grid or list.
  Widget _buildCard(String title, String imagePath) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Displays the provided image at a fixed height.
          Image.asset(imagePath, height: 60),
          SizedBox(height: 8),

          // Displays the title text with centered alignment.
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14.0),
          ),
        ],
      ),
    );
  }

  /// A highlight card widget with a colored background.
  /// Includes a title, description, and a call-to-action button over an image.
  Widget _buildHighlightCard(
    String title, // The title text of the card.
    String description, // The descriptive text explaining the feature.
    String actionText, // The text displayed inside the action button.
    String imagePath, // The image to be displayed on the right side.
  ) {
    return Card(
      color: appThemeColor, // Background color of the card.
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title with bold styling and white color.
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: whiteColor,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                // Left side: Image with action button overlay
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Container(
                      height: 100,
                      width: 100,
                      child: Stack(
                        children: [
                          // Background image that fills the container.
                          Container(
                            height: double.infinity,
                            width: double.infinity,
                            child: Image.asset(imagePath, fit: BoxFit.cover),
                          ),

                          // Semi-transparent overlay for better readability.
                          Center(
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                color: whiteColor.withOpacity(.6),
                              ),
                            ),
                          ),

                          // Action text inside the overlay.
                          Center(
                            child: Container(
                              height: 80,
                              width: 80,
                              padding: EdgeInsets.all(8),
                              child: Text(
                                actionText,
                                style: TextStyle(
                                  color: blackColor,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),

                // Right side: Text content (title & description)
                Expanded(
                  flex: 2,
                  // Description text with white color.
                  child: Text(
                    description,
                    style: TextStyle(color: whiteColor, fontSize: 14.0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// A footer card widget that displays an image, a title, and the number of likes.
  /// Useful for showing popular or recommended items at the bottom of the screen.
  Widget _buildFooterCard(String title, String likes, String imagePath) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Displays the provided image with a fixed height of 40 pixels.
            Image.asset(imagePath, height: 40),
            SizedBox(width: 16),

            // Expanded widget to ensure text takes available space.
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Displays the title in bold with a font size of 16.
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),

                  // Displays the number of likes in a readable format.
                  Text("$likes Likes"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
