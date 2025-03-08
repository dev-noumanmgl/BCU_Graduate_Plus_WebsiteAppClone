import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus_app/utilities/appColors.dart';
import 'package:graduate_plus_app/views/badgeDetailScreen.dart';
import 'package:graduate_plus_app/views/uploadProfileScreen.dart';
import 'package:graduate_plus_app/views/uploadedPostDetailsScreen.dart';
import 'package:graduate_plus_app/widgets/listViewCardWidget.dart';

class ProfileScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(CupertinoIcons.back, color: blackColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        titleSpacing: 0,
        title: Row(
          children: [Image.asset('assets/images/bcuLogo.png', height: 40.0)],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UpdateProfileScreenView(),
                ),
              );
            },
          ), // Search icon
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Header
            CircleAvatar(
              radius: 60.0,
              backgroundColor: Colors.white,
              child: Image.asset(
                'assets/images/profile.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10.0),

            // Badges Section
            SectionHeader(title: 'Mr. Ismail Kilani'),
            Text("ismailkilani@gmail.com"),
            SizedBox(height: 20.0),

            // Stats
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StatCard(title: 'Skill Tags', value: '1'),
                      StatCard(title: 'Badges', value: '12'),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StatCard(title: 'Posts', value: '5'),
                      StatCard(title: 'Projects', value: '3'),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.0),

            // Projects Section
            SectionHeader(title: 'Projects'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'You have not created any project yet.',
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                    IconButton(
                      icon: Icon(Icons.add_circle_outline, color: Colors.black),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20.0),

            // Badges Section
            SectionHeader(title: 'Badges'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BadgeDetailScreenView(),
                          ),
                        );
                      },
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BadgeDetailScreenView(),
                            ),
                          );
                        },
                        child: BadgeItem(
                          title: 'Bronze Award - BCU Graduate+',
                          imageName: "bcuBronzeAward",
                        ),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    BadgeItem(
                      title: 'Silver Award - BCU Graduate+',
                      imageName: "bcuSilverAward",
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20.0),

            // Posts Section
            SectionHeader(title: 'Posts'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UploadedPostDetailsScreenView(),
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
            ),
          ],
        ),
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;

  const StatCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Container(
        width: MediaQuery.of(context).size.width / 2.3,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          children: [
            Text(
              value,
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4.0),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 40,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 14.0, color: Colors.grey),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class BadgeItem extends StatelessWidget {
  final String title;
  final String imageName;

  const BadgeItem({required this.title, required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: blackColor.withOpacity(.1)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 16.0,
            child: Image.asset("assets/images/${imageName}.png"),
          ),
          SizedBox(width: 8.0),
          Text(title, style: TextStyle(fontSize: 14.0)),
        ],
      ),
    );
  }
}

class PostItem extends StatelessWidget {
  final String title;
  final String date;
  final String author;

  const PostItem({
    required this.title,
    required this.date,
    required this.author,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 4.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'posted by: $author',
                  style: TextStyle(fontSize: 12.0, color: Colors.grey),
                ),
                Text(
                  date,
                  style: TextStyle(fontSize: 12.0, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
