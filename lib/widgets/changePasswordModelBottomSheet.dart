import 'package:flutter/material.dart';
import 'package:graduate_plus_app/utilities/commonButton.dart'; // Importing common button widget
import 'package:graduate_plus_app/utilities/customTextField.dart'; // Importing custom text field widget

// Stateful widget for the Change Password Bottom Sheet
class ChangePasswordModelBottomSheet extends StatefulWidget {
  const ChangePasswordModelBottomSheet({Key? key}) : super(key: key);

  @override
  _ChangePasswordModelBottomSheetState createState() =>
      _ChangePasswordModelBottomSheetState();
}

class _ChangePasswordModelBottomSheetState
    extends State<ChangePasswordModelBottomSheet> {
  // Controller for the email input field
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300), // Smooth animation duration
      curve: Curves.easeInOut, // Animation curve
      height:
          250 +
          MediaQuery.of(
            context,
          ).viewInsets.bottom, // Dynamic height based on keyboard visibility
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 8, top: 24),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom:
              MediaQuery.of(context)
                  .viewInsets
                  .bottom, // Prevents content from being hidden by keyboard
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header section with title and close button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Password Change",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  child: Icon(Icons.cancel), // Close icon
                  onTap: () {
                    Navigator.pop(context); // Close bottom sheet
                  },
                ),
              ],
            ),
            SizedBox(height: 20),

            // Email input field
            CustomTextField(
              controller: emailController,
              hintText: 'Enter your email',
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
            SizedBox(height: 40),

            // Reset password button
            GestureDetector(
              // Uncomment below code to enable password reset functionality
              // onTap: () {
              //   if (emailController.text.isNotEmpty) {
              //     passwordReset(
              //         context, emailController.text.toString().trim());
              //   } else {
              //     snackBar(context, "First enter your email");
              //   }
              // },
              child: commonButton(context: context, label: "Reset Password"),
            ),
          ],
        ),
      ),
    );
  }
}
