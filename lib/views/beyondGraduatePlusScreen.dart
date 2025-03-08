import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus_app/utilities/appColors.dart'; // Importing custom colors

/// A stateless widget that represents the BeyondGraduatePlus screen.
/// This screen displays a quarterly magazine section with available editions.
class BeyondGraduatePlusScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Transparent AppBar with a back button and university logo
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

      // Main body content with padding
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align content to the left
          children: [
            // Heading text introducing the magazine
            Text(
              "Stay in the Loop with BeyondGraduatePlus - Your Quarterly Magazine to All Things Student!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            // GridView to display magazine editions
            Expanded(
              child: GridView.count(
                crossAxisCount:
                    MediaQuery.of(context).size.width > 600
                        ? 3
                        : 2, // Responsive layout: 3 columns for larger screens, 2 for smaller
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                children: [
                  _buildCard(
                    "BeyondGraduatePlus September",
                  ), // First magazine card
                  _buildCard(
                    "BeyondGraduatePlus May 20",
                  ), // Second magazine card
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds a card widget displaying the magazine title.
  Widget _buildCard(String title) {
    return Card(
      color: appThemeColor, // Uses theme color for styling
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white, // White text for contrast
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
