import 'package:flutter/material.dart';
import 'package:graduate_plus_app/utilities/appColors.dart';
import 'package:graduate_plus_app/utilities/commonButton.dart';
import 'package:graduate_plus_app/utilities/customTextField.dart';
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 characters long';
                            }
                            return null;
                          },
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePageScreenView(),
                        ),
                      );
                      // TODO: Implement authentication logic
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
