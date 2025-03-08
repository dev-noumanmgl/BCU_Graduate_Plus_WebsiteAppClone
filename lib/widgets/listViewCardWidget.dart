import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus_app/utilities/appColors.dart';

// Custom Widget to display a ListView Card with an image, title, description, and interactive icons
class ListViewCardWidget extends StatelessWidget {
  // Properties for the card
  final String imagePath, title, description;
  final int likes;
  bool isBookmark, isLiked;

  // Constructor with required and optional parameters
  ListViewCardWidget({
    required this.imagePath,
    required this.title,
    required this.likes,
    required this.description,
    this.isBookmark = false,
    this.isLiked = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 8.0), // Space between cards
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
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
                child: Image.asset(imagePath.toString(), fit: BoxFit.cover),
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
                      title.toString(),
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: blackColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis, // Truncate long text
                    ),
                    SizedBox(height: 6),
                    // Description
                    Text(
                      description.toString(),
                      style: TextStyle(fontSize: 14.0, color: blackColor),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis, // Truncate long text
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
                  Icon(isBookmark ? Icons.bookmark : Icons.bookmark_border),
                  Spacer(), // Pushes like section to the bottom
                  // Like Icon and Count
                  Row(
                    children: [
                      Icon(
                        isLiked
                            ? CupertinoIcons.heart_fill
                            : CupertinoIcons.heart,
                      ),
                      SizedBox(width: 4),
                      Text(
                        likes.toString(),
                        style: TextStyle(fontSize: 14, color: blackColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
