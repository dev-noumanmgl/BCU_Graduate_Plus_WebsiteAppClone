import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus_app/utilities/appColors.dart';
import 'package:graduate_plus_app/views/graduateEventDetailScreenView.dart';
import 'package:graduate_plus_app/widgets/listViewCardWidget.dart';

class MyContentScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size =
        MediaQuery.of(
          context,
        ).size; // Get the screen size for responsive layout

    return DefaultTabController(
      length: 3, // Define three tabs
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: appThemeColor,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipOval(
              child: Container(
                height: 44,
                width: 44,
                color: whiteColor.withOpacity(.9),
                child: Center(
                  child: Icon(Icons.arrow_back_rounded, color: blackColor),
                ),
              ),
            ),
          ),
          centerTitle: true,
          title: Text(
            "My Content",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: whiteColor,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search, color: whiteColor),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            // Tab Bar Section
            Container(
              color: appThemeColor, // Set background color for the tab bar
              child: TabBar(
                indicatorColor:
                    whiteColor, // Set the indicator color for active tab
                labelColor: whiteColor, // Set text color for selected tab
                unselectedLabelColor: whiteColor.withOpacity(
                  .7,
                ), // Set color for inactive tabs
                tabs: [
                  Tab(text: 'Recently Viewed'), // First tab
                  Tab(text: 'Saved'), // Second tab
                  Tab(text: 'Assessments'), // Third tab
                ],
              ),
            ),

            // Tab Bar View (Content for each tab)
            Expanded(
              child: TabBarView(
                children: [
                  ContentListView(size: size), // Content for 'Recently Viewed'
                  ContentListView(size: size), // Content for 'Saved'
                  ContentListView(size: size), // Content for 'Assessments'
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget to display list of content items in each tab
class ContentListView extends StatelessWidget {
  final Size size; // Screen size for responsive design

  const ContentListView({required this.size});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding around content
        child: ListView.builder(
          shrinkWrap: true, // Ensure ListView does not take infinite space
          itemCount: 8, // Number of items in the list
          physics:
              NeverScrollableScrollPhysics(), // Prevent scrolling inside ListView (handled by SingleChildScrollView)
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
                imagePath: 'assets/images/bcuFB.png', // Image for content item
                title:
                    index % 2 == 0
                        ? 'Question sets and reports for students' // Alternate titles for list items
                        : 'Give feedback - it only takes 2 minutes',
                likes: 213, // Number of likes (static for now)
                isBookmark: true, // Show bookmark icon
                isLiked: true, // Show liked icon
                description:
                    'Some of the most vivid and effective descriptive writing in music can be found in rap', // Static description
              ),
            );
          },
        ),
      ),
    );
  }
}
