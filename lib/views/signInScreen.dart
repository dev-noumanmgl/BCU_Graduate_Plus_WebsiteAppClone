import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:graduate_plus_app/firebaseDatabase/getStudentInfo.dart';
import 'package:graduate_plus_app/sharedPreference/sharedPreferenceHelper.dart';
import 'package:graduate_plus_app/utilities/appColors.dart';
import 'package:graduate_plus_app/utilities/commonButton.dart';
import 'package:graduate_plus_app/utilities/customTextField.dart';
import 'package:graduate_plus_app/utilities/models/studentPrsnlInfoModel.dart';
import 'package:graduate_plus_app/utilities/textStyles.dart';
import 'package:graduate_plus_app/views/homePageScreen.dart';
import 'package:graduate_plus_app/views/signUpScreen.dart';
import 'package:graduate_plus_app/widgets/changePasswordModelBottomSheet.dart';

class SignInScreenView extends StatefulWidget {
  const SignInScreenView({Key? key}) : super(key: key);

  @override
  State<SignInScreenView> createState() => _SignInScreenViewState();
}

class _SignInScreenViewState extends State<SignInScreenView> {
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // Key for form validation
  TextEditingController emailController =
      TextEditingController(); // Controller for email input
  TextEditingController passwordController =
      TextEditingController(); // Controller for password input

  // Error messages for form validation
  String? emailError, passwordError;

  @override
  void initState() {
    super.initState();
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

  Future<void> signIn() async {
    setState(() {
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
        emailError == null &&
        passwordError == null) {
      try {
        SmartDialog.showLoading(msg: "Please wait...");
        final UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
            );
        if (userCredential != null) {
          if (userCredential.user!.emailVerified) {
            StudentPrsnlInfoModel? userInfo =
                await getUserPersonalInfoFromDatabase(
                  userCredential.user!.uid.toString().trim(),
                );
            if (userInfo != null) {
              SharedPrefrenceHelper().saveDisplayName(
                userInfo.userFullName.toString().trim(),
              );
              SharedPrefrenceHelper().saveUserEmail(
                userInfo.userEmail.toString().trim(),
              );
              SharedPrefrenceHelper().saveUserId(
                userCredential.user!.uid.toString().trim(),
              );
              SharedPrefrenceHelper().saveUserPic(
                userInfo.profileImage.toString().trim(),
              );
            }

            SmartDialog.dismiss();
            // ignore: use_build_context_synchronously
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePageScreenView()),
            );
          } else {
            SmartDialog.dismiss();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Please verify your email before login")),
            );
          }
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Email or password is wrong")));
        }
      } on FirebaseAuthException catch (e) {
        SmartDialog.dismiss();
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Account not exist for that email")),
          );
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Email or password is wrong")));
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Email or password is wrong")));
        }
      }
    }
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
          "Sign In",
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
                  notification
                      .disallowIndicator(); // Prevent overscroll glow effect
                  return true;
                },
                child: SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Email Input Field
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Email", style: textStyleRegular()),
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          controller: emailController,
                          hintText: 'Email...',
                          prefixIcon: Icons.mail_outline,
                          errorText: emailError,
                          isEmail: true,
                        ),
                        SizedBox(height: 20.0),

                        // Password Input Field
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Password", style: textStyleRegular()),
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          controller: passwordController,
                          hintText: '********',
                          prefixIcon: Icons.lock_outline,
                          obscureText: true, // Hide password
                          errorText: passwordError,
                          isEmail: false,
                        ),

                        // Forgot Password Button
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () async {
                              await showModalBottomSheet(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(12),
                                    topLeft: Radius.circular(12),
                                  ),
                                ),
                                context: context,
                                builder: (context) {
                                  return ChangePasswordModelBottomSheet();
                                },
                              );
                            },
                            child: Text(
                              "Forgot Password?",
                              style: textStyleBold(appThemeColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Login Button
            Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: GestureDetector(
                    onTap: () {
                      signIn();
                    },
                    child: commonButton(context: context, label: "Login"),
                  ),
                ),

                // Sign Up Navigation
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Do you have an account? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpScreenView(),
                            ),
                          );
                        },
                        child: Text(
                          "Sign Up",
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
}
