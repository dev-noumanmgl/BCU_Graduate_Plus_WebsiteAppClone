import 'dart:io'; // Importing dart:io to work with file operations

import 'package:flutter/cupertino.dart'; // Cupertino package for iOS-style widgets
import 'package:flutter/material.dart'; // Material package for UI components
import 'package:graduate_plus_app/utilities/appColors.dart'; // Importing custom colors
import 'package:graduate_plus_app/utilities/commonButton.dart'; // Importing custom button widget
import 'package:graduate_plus_app/utilities/textStyles.dart'; // Importing text styles
import 'package:graduate_plus_app/widgets/chooseProfileImageBottomSheetWidget.dart'; // Importing custom bottom sheet for profile image selection
import 'package:image_picker/image_picker.dart'; // Importing image picker for selecting images

// Stateful widget for updating the user's profile
class UpdateProfileScreenView extends StatefulWidget {
  @override
  State<UpdateProfileScreenView> createState() =>
      _UpdateProfileScreenViewState();
}

// State class for handling profile update functionality
class _UpdateProfileScreenViewState extends State<UpdateProfileScreenView> {
  File? selectedImage; // Stores the selected image file

  @override
  Widget build(BuildContext context) {
    final double screenHeight =
        MediaQuery.of(context).size.height; // Getting screen height
    final double screenWidth =
        MediaQuery.of(context).size.width; // Getting screen width

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
        title: Text(
          "Update Profile",
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (notification) {
                notification
                    .disallowIndicator(); // Disables overscroll glow effect
                return true;
              },
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Profile Image Selection
                    GestureDetector(
                      onTap: () async {
                        final result = await showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12),
                              topLeft: Radius.circular(12),
                            ),
                          ),
                          context: context,
                          builder: (context) {
                            return chooseProfileImagesBottomSheet(
                              context: context,
                            );
                          },
                        );
                        if (result != null) {
                          chooseImage(
                            type: result,
                            context: context,
                          ); // Calls function to pick image
                        }
                      },
                      child: Container(
                        height:
                            screenWidth *
                            0.35, // Responsive image container size
                        width: screenWidth * 0.35,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle, // Circular image container
                          border: Border.all(
                            color: appThemeColor,
                            width: 1,
                          ), // Border styling
                        ),
                        child: ClipOval(
                          child:
                              selectedImage != null
                                  ? Image.file(
                                    selectedImage!,
                                    fit: BoxFit.cover, // Display selected image
                                  )
                                  : Container(
                                    color:
                                        appThemeColor, // Placeholder background color
                                    child: Icon(
                                      Icons.edit,
                                      size: 30,
                                      color:
                                          whiteColor, // Placeholder edit icon
                                    ),
                                  ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Email Input Field
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Email', // Label for input field
                        prefixIcon: Icon(Icons.email), // Icon for input field
                        border:
                            OutlineInputBorder(), // Input field border styling
                      ),
                    ),
                    SizedBox(height: 10),

                    // Post Title Input Field
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Post Title', // Label for input field
                        prefixIcon: Icon(Icons.title), // Icon for input field
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),

                    // Bio Input Field
                    TextField(
                      maxLines: 3, // Allowing multiple lines for bio input
                      decoration: InputDecoration(
                        labelText: 'Add Bio', // Label for input field
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                  ],
                ),
              ),
            ),
          ),

          // Update Profile Button
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: commonButton(
              context: context,
              label: "Update Profile",
            ), // Calling reusable button widget
          ),
        ],
      ),
    );
  }

  // Function to choose an image from the camera or gallery
  Future<void> chooseImage({
    required String type,
    required BuildContext context,
  }) async {
    final picker = ImagePicker(); // Initializing image picker
    final pickedImage =
        type == "camera"
            ? await picker.pickImage(
              source: ImageSource.camera,
            ) // Capture from camera
            : await picker.pickImage(
              source: ImageSource.gallery,
            ); // Pick from gallery

    if (pickedImage != null) {
      setState(() {
        selectedImage = File(pickedImage.path); // Updating selected image state
      });
    }
  }
}
