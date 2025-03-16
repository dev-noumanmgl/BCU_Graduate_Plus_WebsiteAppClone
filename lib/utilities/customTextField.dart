import 'package:flutter/material.dart'; // Importing Flutter Material package
import 'package:graduate_plus_app/utilities/appColors.dart'; // Importing custom app colors

// A reusable custom text field widget
class CustomTextField extends StatelessWidget {
  // Controller to manage text input
  final TextEditingController controller;

  // Placeholder text for the input field
  final String hintText;
  final String? errorText;

  // Optional prefix icon for the input field
  final IconData? prefixIcon;

  // Determines whether the text should be obscured (e.g., for passwords)
  final bool obscureText, isEmail;

  // Validator function for form validation
  final String? Function(String?)? validator;

  // Constructor to initialize required and optional parameters
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.errorText,
    required this.isEmail,
    this.prefixIcon,
    this.obscureText = false, // Default value set to false (not obscured)
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller, // Assigning the text controller
      obscureText: obscureText, // Hides text if true (for passwords)
      decoration: InputDecoration(
        hintText: hintText, // Display hint text
        prefixIcon:
            prefixIcon != null
                ? Icon(prefixIcon)
                : null, // Show prefix icon if provided
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0), // Rounded borders
        ),
        errorText: errorText, // Display error message if validation fails
        filled: true, // Enables background color
        fillColor: whiteColor.withOpacity(
          .8,
        ), // Slightly transparent white background
      ),
      validator: validator, // Uses the provided validator function (if any)
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
    );
  }
}
