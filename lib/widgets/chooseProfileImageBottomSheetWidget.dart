import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus_app/utilities/textStyles.dart'; // Importing text styles

/// Function to display a bottom sheet for choosing a profile image
Widget chooseProfileImagesBottomSheet({required BuildContext context}) {
  return Container(
    padding: const EdgeInsets.only(left: 24, right: 24, bottom: 8, top: 24),
    height: 160, // Fixed height for the bottom sheet
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Header section with title and close button
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Choose Profile Image", style: textStyleH3(Colors.black)),
            InkWell(
              child: Icon(Icons.cancel), // Close icon
              onTap: () {
                Navigator.pop(context); // Close the bottom sheet
              },
            ),
          ],
        ),
        const SizedBox(height: 4),

        // Options for selecting Camera or Gallery
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                InkWell(
                  onTap:
                      () => Navigator.of(
                        context,
                      ).pop("camera"), // Return "camera" option
                  child: circleAvatarIconView(Icons.camera_alt), // Camera icon
                ),
                const SizedBox(height: 15),
                const Text("Camera"), // Label for Camera option
              ],
            ),
            const SizedBox(width: 50), // Space between options
            Column(
              children: [
                InkWell(
                  onTap:
                      () => Navigator.of(
                        context,
                      ).pop("gallery"), // Return "gallery" option
                  child: circleAvatarIconView(
                    CupertinoIcons.graph_square_fill,
                  ), // Gallery icon
                ),
                const SizedBox(height: 15),
                const Text("Gallery"), // Label for Gallery option
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

/// Widget to create a circular avatar icon with a border
Widget circleAvatarIconView(IconData icon) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(
        Radius.circular(24),
      ), // Circular border
      border: Border.all(color: Colors.black.withOpacity(.6)), // Border styling
    ),
    child: CircleAvatar(
      backgroundColor: Colors.white, // White background
      child: Icon(
        icon,
        color: Colors.black.withOpacity(.6),
      ), // Icon with opacity
    ),
  );
}
