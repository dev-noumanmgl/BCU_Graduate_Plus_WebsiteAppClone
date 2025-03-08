import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus_app/utilities/appColors.dart';
import 'package:graduate_plus_app/views/studentDiscoveryToolScreen.dart';

class JiscDiscoveryToolScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar section
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(CupertinoIcons.back, color: blackColor),
          onPressed: () {}, // TODO: Implement back navigation
        ),
        titleSpacing: 0,
        title: Image.asset(
          'assets/images/bcuLogo.png',
          height: 40.0,
        ), // University Logo
      ),

      // Main Content Body
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Banner Image
            Card(
              elevation: 4,
              margin: EdgeInsets.all(0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  'assets/images/jisc.png',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16.0),

            // Page Title
            Text(
              'Welcome to the Jisc discovery tool',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8.0),

            // Subtitle / Description
            Text(
              'Explore the question sets and resources available to you by selecting the discovery tool tile below. If you need any help, please take a look at our guidance pages.',
              style: TextStyle(fontSize: 16.0, color: Colors.black87),
            ),
            SizedBox(height: 16.0),

            // Discovery Tool Tile (Clickable Section)
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StudentDiscoveryToolScreen(),
                  ),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 2.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: greyColor.withOpacity(0.3)),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image for the Discovery Tool
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(8.0),
                          ),
                          child: Image.asset(
                            "assets/images/bcuDiscToolPic.png",
                            height: 120.0,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),

                        // Title inside the tile
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Text(
                                "Discovery tool for students",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: blackColor,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 8.0),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
