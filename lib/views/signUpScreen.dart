import 'dart:io';
import 'package:flutter/material.dart';
import 'package:graduate_plus_app/utilities/appColors.dart';
import 'package:graduate_plus_app/utilities/commonButton.dart';
import 'package:graduate_plus_app/utilities/customTextField.dart';
import 'package:graduate_plus_app/utilities/textStyles.dart';
import 'package:graduate_plus_app/views/signInScreen.dart';
import 'package:graduate_plus_app/widgets/chooseProfileImageBottomSheetWidget.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreenView extends StatefulWidget {
  const SignUpScreenView({Key? key}) : super(key: key);

  @override
  State<SignUpScreenView> createState() => _SignUpScreenViewState();
}

class _SignUpScreenViewState extends State<SignUpScreenView> {
  File? selectedImage;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          "Sign Up",
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (notification) {
                  notification.disallowIndicator();
                  return true;
                },
                child: SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.black.withOpacity(.9),
                                  width: 1,
                                ),
                              ),
                              child: ClipOval(
                                child:
                                    (selectedImage != null)
                                        ? Image.file(
                                          selectedImage!,
                                          fit: BoxFit.cover,
                                        )
                                        : Container(
                                          color: appThemeColor,
                                          child: const Icon(
                                            Icons.person,
                                            size: 60,
                                          ),
                                        ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: InkWell(
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
                                    chooseImage(result, context);
                                  }
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    color: Colors.black,
                                    child: const Center(
                                      child: Icon(
                                        Icons.camera_alt_rounded,
                                        size: 24,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        SizedBox(height: 40.0),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Full Name", style: textStyleRegular()),
                        ),
                        const SizedBox(height: 8),

                        // Email TextField
                        CustomTextField(
                          controller: nameController,
                          hintText: 'Name...',
                          prefixIcon: Icons.mail_outline,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            } else if (!RegExp(
                              r'^[^@\s]+@[^@\s]+\.[^@\s]+\$',
                            ).hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.0),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Email", style: textStyleRegular()),
                        ),
                        const SizedBox(height: 8),

                        // Email TextField
                        CustomTextField(
                          controller: emailController,
                          hintText: 'Email...',
                          prefixIcon: Icons.mail_outline,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            } else if (!RegExp(
                              r'^[^@\s]+@[^@\s]+\.[^@\s]+\$',
                            ).hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.0),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Password", style: textStyleRegular()),
                        ),
                        const SizedBox(height: 8),
                        // Password TextField
                        CustomTextField(
                          controller: passwordController,
                          hintText: '********',
                          prefixIcon: Icons.lock_outline,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 characters long';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: GestureDetector(
                child: commonButton(context: context, label: "Sign Up"),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Do you have already account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInScreenView(),
                        ),
                      );
                    },
                    child: Text("Sign In", style: textStyleBold(appThemeColor)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<File?> chooseImage(type, context) async {
    var image;
    if (type == "camera") {
      image = await ImagePicker().pickImage(source: ImageSource.camera);
    } else {
      image = await ImagePicker().pickImage(source: ImageSource.gallery);
    }

    File? img = image != null ? File(image.path) : null;
    if (img != null) {
      setState(() {
        selectedImage = img;
      });
    } else {
      print("Image selection canceled");
    }
  }
}
