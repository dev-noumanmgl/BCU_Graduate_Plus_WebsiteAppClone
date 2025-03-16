import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus_app/sharedPreference/sharedPreferenceHelper.dart';
import 'package:graduate_plus_app/utilities/appColors.dart';
import 'package:graduate_plus_app/utilities/textStyles.dart';
import 'package:graduate_plus_app/views/badgeDetailScreen.dart';
import 'package:graduate_plus_app/views/uploadProfileScreen.dart';
import 'package:graduate_plus_app/views/uploadedPostDetailsScreen.dart';
import 'package:graduate_plus_app/widgets/listViewCardWidget.dart';

class ProfileScreenView extends StatefulWidget {
  @override
  State<ProfileScreenView> createState() => _ProfileScreenViewState();
}

class _ProfileScreenViewState extends State<ProfileScreenView> {
  String userName = "";
  String userEmail = "";
  String userId = "";
  String profilePic = "";

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  /// Load user details from SharedPreferences
  Future<void> _loadUserData() async {
    String? name = await SharedPrefrenceHelper().getDisplayName();
    String? email = await SharedPrefrenceHelper().getUserEmail();
    String? id = await SharedPrefrenceHelper().getUserId();
    String? profilePic = await SharedPrefrenceHelper().getUserPic();

    setState(() {
      userName = name ?? "Guest";
      userEmail = email ?? "No Email";
      userId = id ?? "Unknown";
      profilePic = profilePic ?? "No Pic";
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
              child: CachedNetworkImage(
                imageUrl: profilePic,
                fit: BoxFit.cover,
                progressIndicatorBuilder:
                    (context, url, downloadProgress) =>
                        CupertinoActivityIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(height: 10.0),

            // Badges Section
            Text(
              userName,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(userEmail),
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

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                elevation: 4,
                margin: EdgeInsets.all(0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    children: [
                      // Badges Section
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Badges",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 2),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "These badges are only given to those who complete the related activities.",
                          style: textStyleLight(blackColor),
                        ),
                      ),
                      SizedBox(height: 4),
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
                          child: Card(
                            elevation: 2,
                            margin: EdgeInsets.all(0),
                            child: BadgeItem(
                              title: 'Bronze Award - BCU Graduate+',
                              imageName: "bcuBronzeAward",
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Card(
                        elevation: 2,
                        margin: EdgeInsets.all(0),
                        child: BadgeItem(
                          title: 'Silver Award - BCU Graduate+',
                          imageName: "bcuSilverAward",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                elevation: 4,
                margin: EdgeInsets.all(0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Posts",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 2),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "2 moments posted by Mr. Ismail Kilani since 2024",
                          style: textStyleLight(blackColor),
                        ),
                      ),
                      SizedBox(height: 4),
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
                                      (context) =>
                                          UploadedPostDetailsScreenView(),
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
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
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

class BadgeItem extends StatelessWidget {
  final String title;
  final String imageName;

  const BadgeItem({required this.title, required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
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
