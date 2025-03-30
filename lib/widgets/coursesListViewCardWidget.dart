import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus_app/utilities/appColors.dart';
import 'package:graduate_plus_app/utilities/models/courseModel.dart';
import 'package:graduate_plus_app/views/courseDetailsScreenView.dart';
import 'package:graduate_plus_app/views/courseFeedbackDetailScreenView.dart';

class CoursesListViewCardWidget extends StatelessWidget {
  final bool hasLogo;
  final String postedBy;
  final String postedDate;
  final String nextScreen;
  final Future<List<CoursesModel>> futureCourses;
  const CoursesListViewCardWidget({
    super.key,
    required this.hasLogo,
    required this.postedBy,
    required this.postedDate,
    required this.nextScreen,
    required this.futureCourses,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CoursesModel>>(
      future: futureCourses,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text("No courses available"));
        }

        List<CoursesModel> courses = snapshot.data!;
        return ListView.builder(
          shrinkWrap: true, // Fits within the scroll view
          itemCount: courses.length, // Number of items
          physics: NeverScrollableScrollPhysics(), // Prevents nested scrolling
          itemBuilder: (context, index) {
            final curr = courses[index];
            return GestureDetector(
              onTap: () {
                nextScreen == 'course'
                    ? Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => Coursedetailsscreenview(
                              courses: courses[index],
                            ),
                      ),
                    )
                    : Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => Coursefeedbackdetailscreenview(
                              courses: courses[index],
                            ),
                      ),
                    );
              },
              child: Card(
                margin: EdgeInsets.only(bottom: 8.0), // Space between cards
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 4.0, // Adds shadow effect
                child: SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Row(
                    children: [
                      // Image Section
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: curr.image,
                            height: 120,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    CupertinoActivityIndicator(),
                            errorWidget:
                                (context, url, error) => Icon(Icons.error),
                          ),
                        ),
                      ),
                      // Title and Description Section
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Title
                              Text(
                                curr.title.toString(),
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: blackColor,
                                ),
                                maxLines: 1,
                                overflow:
                                    TextOverflow.ellipsis, // Truncate long text
                              ),
                              SizedBox(height: 6),
                              // Description
                              Text(
                                curr.description.join("\n\n"),
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: blackColor,
                                ),
                                maxLines: 2,
                                overflow:
                                    TextOverflow.ellipsis, // Truncate long text
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Bookmark and Like Section
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            // Bookmark Icon
                            Icon(Icons.bookmark, color: appThemeColor),
                            Spacer(), // Pushes like section to the bottom
                            // Like Icon and Count
                            Row(
                              children: [
                                Icon(
                                  CupertinoIcons.heart,
                                  color: appThemeColor,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  curr.like.toString(),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: appThemeColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
