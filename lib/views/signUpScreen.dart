import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:graduate_plus_app/utilities/models/studentPrsnlInfoModel.dart';
import 'package:graduate_plus_app/views/signInScreen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:graduate_plus_app/utilities/appColors.dart';
import 'package:graduate_plus_app/utilities/commonButton.dart';
import 'package:graduate_plus_app/utilities/customTextField.dart';
import 'package:intl/intl.dart';
import 'package:graduate_plus_app/utilities/textStyles.dart';
import 'package:graduate_plus_app/widgets/chooseProfileImageBottomSheetWidget.dart';

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
  // Error messages for form validation
  String? emailError, passwordError, nameError;

  @override
  void initState() {
    super.initState();
    nameController.addListener(() {
      if (nameError != null && nameController.text.isNotEmpty) {
        setState(() {
          nameError = null;
        });
      }
    });
    emailController.addListener(() {
      if (emailError != null && emailController.text.isNotEmpty) {
        setState(() {
          emailError = null;
        });
      }
    });
    passwordController.addListener(() {
      if (passwordError != null && passwordController.text.isNotEmpty) {
        setState(() {
          passwordError = null;
        });
      }
    });
  }

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
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final result = await showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                          ),
                          builder:
                              (context) => chooseProfileImagesBottomSheet(
                                context: context,
                              ),
                        );
                        if (result != null) chooseImage(result);
                      },
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundColor: appThemeColor,
                            backgroundImage:
                                selectedImage != null
                                    ? FileImage(selectedImage!)
                                    : null,
                            child:
                                selectedImage == null
                                    ? Icon(Icons.person, size: 60)
                                    : null,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.black,
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),

                    // Error disappears when user types
                    CustomTextField(
                      controller: nameController,
                      hintText: 'Full Name',
                      prefixIcon: Icons.person,
                      errorText: nameError,
                      isEmail: false,
                    ),
                    SizedBox(height: 20),

                    CustomTextField(
                      controller: emailController,
                      hintText: 'Email',
                      prefixIcon: Icons.mail_outline,
                      errorText: emailError,
                      isEmail: false,
                    ),
                    SizedBox(height: 20),

                    CustomTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      prefixIcon: Icons.lock_outline,
                      obscureText: true,
                      errorText: passwordError,
                      isEmail: false,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: GestureDetector(
                    onTap: () => signUp(),
                    child: commonButton(context: context, label: "Sign Up"),
                  ),
                ),

                // Sign Up Navigation
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignInScreenView(),
                            ),
                          );
                        },
                        child: Text(
                          "Sign In",
                          style: textStyleBold(appThemeColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> signUp() async {
    setState(() {
      nameError = nameController.text.trim().isEmpty ? "Required field" : null;
      emailError =
          emailController.text.trim().isEmpty
              ? "Required field"
              : !RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              ).hasMatch(emailController.text.trim())
              ? "Enter a valid email"
              : null;
      passwordError =
          passwordController.text.trim().isEmpty
              ? "Required field"
              : passwordController.text.trim().length < 6
              ? "Password must be at least 6 characters"
              : null;
    });

    if (_formKey.currentState!.validate() &&
        nameError == null &&
        emailError == null &&
        passwordError == null) {
      if (selectedImage != null) {
        SmartDialog.showLoading(msg: "Please wait...");

        final FirebaseAuth _auth = FirebaseAuth.instance;

        try {
          UserCredential userCredential = await _auth
              .createUserWithEmailAndPassword(
                email: emailController.text.trim(),
                password: passwordController.text.trim(),
              );
          if (userCredential.user != null) {
            String uid = userCredential.user!.uid;

            await userCredential.user!.sendEmailVerification();
            String imageUrl = "";
            if (selectedImage != null) {
              final storageRef = FirebaseStorage.instance.ref().child(
                'profile_images/${userCredential.user!.uid}.jpg',
              );
              await storageRef.putFile(selectedImage!);
              imageUrl = await storageRef.getDownloadURL();
            }

            String formattedDate = DateFormat(
              'd/M/yyyy',
            ).format(DateTime.now());

            StudentPrsnlInfoModel userPersonalInfoModel = StudentPrsnlInfoModel(
              profileImage: imageUrl,
              userFullName: nameController.text.trim(),
              userEmail: emailController.text.trim(),
              userId: uid,
              userPassword: passwordController.text.trim(),
              accountCreatedDate: formattedDate,
            );

            await FirebaseDatabase.instance
                .ref("students/${userCredential.user!.uid}")
                .set(userPersonalInfoModel.toJson())
                .whenComplete(() {
                  SmartDialog.dismiss();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Graduate + App's team send you email for verification. Pleas check it for next proceed!",
                      ),
                    ),
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignInScreenView()),
                  );
                });
          }
        } catch (e) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Error: ${e.toString()}")));
        } finally {
          SmartDialog.dismiss();
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("First pic profile image to continue registration"),
          ),
        );
      }
    }
  }

  void _clearForm() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();

    setState(() {
      nameError = null;
      emailError = null;
      passwordError = null;
    });
  }

  Future<void> chooseImage(String type) async {
    XFile? image;
    if (type == "camera") {
      image = await ImagePicker().pickImage(source: ImageSource.camera);
    } else {
      image = await ImagePicker().pickImage(source: ImageSource.gallery);
    }
    if (image != null) {
      setState(() => selectedImage = File(image!.path));
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
