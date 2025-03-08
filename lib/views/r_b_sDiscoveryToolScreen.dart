import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus_app/utilities/appColors.dart';
import 'package:graduate_plus_app/utilities/textStyles.dart';
import 'package:graduate_plus_app/widgets/listViewCardWidget.dart';

class RBSDiscoveryToolScreenView extends StatelessWidget {
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
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Banner Section
              Card(
                elevation: 4,
                margin: EdgeInsets.all(0),
                child: Container(
                  height: 79,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage('assets/images/bcuResBank.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),

              // Title Section
              Text(
                'Resource bank for students',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
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
                      Text("Jisc", style: textStyleBold(blackColor)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.heart_fill,
                        size: 22.0,
                        color: appThemeColor,
                      ),
                      SizedBox(width: 4.0),
                      Text('592'),
                      SizedBox(width: 16.0),
                      Icon(
                        CupertinoIcons.bookmark_fill,
                        size: 18.0,
                        color: appThemeColor,
                      ),
                      SizedBox(width: 16.0),
                      Icon(
                        CupertinoIcons.arrow_down_to_line,
                        size: 20.0,
                        color: Colors.black,
                      ),
                      SizedBox(width: 16.0),
                      Icon(
                        CupertinoIcons.share,
                        size: 20.0,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.0),

              // Description
              Text(
                'Below you will find a range of resources that have been mapped to the different elements of the digital capability framework and other elements used in the question sets.',
                style: TextStyle(fontSize: 14.0, color: Colors.grey.shade600),
              ),
              SizedBox(height: 16.0),

              // Section 1
              SectionWidget(
                title: 'Question sets and reports for students',
                itemCount: 4,
              ),
              SizedBox(height: 16.0),

              // Section 2
              SectionWidget(
                title: 'Digital skills in AI and generative AI',
                itemCount: 4,
              ),
              SizedBox(height: 16.0),

              // Section 3
              SectionWidget(
                title: 'Overall digital capabilities resource bank',
                itemCount: 4,
              ),
              SizedBox(height: 16.0),

              // Section 4
              SectionWidget(title: 'New students resource bank', itemCount: 4),
              SizedBox(height: 16.0),

              // Section 5
              SectionWidget(title: 'Publisher collections', itemCount: 4),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionWidget extends StatelessWidget {
  final String title;
  final int itemCount;

  const SectionWidget({required this.title, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        ListView.builder(
          shrinkWrap: true,
          itemCount: 6,
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
    );
  }
}
