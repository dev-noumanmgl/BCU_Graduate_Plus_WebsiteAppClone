import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus_app/utilities/appColors.dart';
import 'package:graduate_plus_app/views/eventsDetailScreen.dart';
import 'package:graduate_plus_app/widgets/drawerViewWidget.dart';
import 'package:graduate_plus_app/widgets/listViewCardWidget.dart';
import 'package:video_player/video_player.dart';

class HomePageScreenView extends StatefulWidget {
  @override
  _HomePageScreenViewState createState() => _HomePageScreenViewState();
}

class _HomePageScreenViewState extends State<HomePageScreenView> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset(
        'assets/videos/bcuHomeVideo.mp4',
      )
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final awards = [
      {
        'title': 'Bronze Award:\nActivities',
        'subtitle': 'Choose your next achievement...',
        'image': 'assets/images/bcuBronzeAward.png',
        'likes': 110,
      },
      {
        'title': 'Silver Award',
        'subtitle': 'Choose your next achievement...',
        'image': 'assets/images/bcuBronzeAward.png',
        'likes': 110,
      },
      {
        'title': 'What is the Graduate+ Award',
        'subtitle': 'Choose your next achievement...',
        'image': 'assets/images/bcuBronzeAward.png',
        'likes': 110,
      },
    ];

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
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          // Wrap the menu icon in a Builder widget to get the correct context
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.menu, color: Colors.black),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ],
      ),
      // Add the Drawer to the Scaffold
      drawer: DrawerViewWidget(context), // Add your drawer view widget here
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Graduate+ is an extra & co-curricular awards framework offered to all students at BCU across all faculties & courses. It is designed to help you stand out from the crowd, whilst preparing you for your future.',
              style: TextStyle(fontSize: 16.0, color: Colors.black87),
            ),
            SizedBox(height: 16.0),

            // Embedded Video
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child:
                    _videoController.value.isInitialized
                        ? Stack(
                          alignment: Alignment.center,
                          children: [
                            AspectRatio(
                              aspectRatio: _videoController.value.aspectRatio,
                              child: VideoPlayer(_videoController),
                            ),
                            IconButton(
                              icon: Icon(
                                _videoController.value.isPlaying
                                    ? Icons.pause_circle_filled
                                    : Icons.play_circle_filled,
                                size: 50,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  _videoController.value.isPlaying
                                      ? _videoController.pause()
                                      : _videoController.play();
                                });
                              },
                            ),
                          ],
                        )
                        : Center(child: CircularProgressIndicator()),
              ),
            ),
            SizedBox(height: 16.0),

            // Description Text
            Text(
              "It includes travel incentives, helpful tips for managing your finances, access to professional financial support, and discounts on food and drink across our campuses.",
              style: TextStyle(fontSize: 16.0, color: Colors.black87),
            ),
            SizedBox(height: 16.0),

            // Explore Bronze Award Section
            Image.asset(
              'assets/images/bcuExploreBanner.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            SizedBox(height: 16),
            // Cards Section: Displays awards in a grid format
            ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
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

            SizedBox(height: 16.0),

            // Other Projects Section
            Text(
              'Other Projects',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold, // Makes heading stand out
              ),
            ),
            SizedBox(height: 8.0),

            // Grid for displaying other projects
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
