import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:graduate_plus_app/sharedPreference/sharedPreferenceHelper.dart';
import 'package:graduate_plus_app/sharedPreference/sharedPreferenceforJobSection.dart';
import 'package:graduate_plus_app/utilities/appColors.dart';
import 'package:graduate_plus_app/utilities/commonButton.dart';
import 'package:graduate_plus_app/utilities/customTextField.dart';
import 'package:graduate_plus_app/utilities/textStyles.dart';
import 'package:graduate_plus_app/views/gradcrackerJobs/professionalInfoScreen.dart';

class PersonalInfoScreenView extends StatefulWidget {
  const PersonalInfoScreenView({Key? key}) : super(key: key);

  @override
  State<PersonalInfoScreenView> createState() => _PersonalInfoScreenViewState();
}

class _PersonalInfoScreenViewState extends State<PersonalInfoScreenView> {
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // Key for form validation
  TextEditingController emailController =
      TextEditingController(); // Controller for email input
  TextEditingController locationController = TextEditingController();
  TextEditingController nameController =
      TextEditingController(); // Controller for password input

  // Error messages for form validation
  String? emailError, nameError, locationError;

  @override
  void initState() {
    super.initState();
    _loadSavedData();
    emailController.addListener(() {
      if (emailError != null && emailController.text.isNotEmpty) {
        setState(() {
          emailError = null;
        });
      }
    });
    nameController.addListener(() {
      if (nameError != null && nameController.text.isNotEmpty) {
        setState(() {
          nameError = null;
        });
      }
    });
    locationController.addListener(() {
      if (locationError != null && locationController.text.isNotEmpty) {
        setState(() {
          locationError = null;
        });
      }
    });
  }

  // Load saved data from SharedPreferences
  void _loadSavedData() async {
    nameController.text = await SharedPreferenceHelper.getName() ?? '';
    emailController.text = await SharedPreferenceHelper.getEmail() ?? '';
    locationController.text = await SharedPreferenceHelper.getLocation() ?? '';
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
      locationError =
          locationController.text.trim().isEmpty ? "Required field" : null;
      nameError =
          nameController.text.trim().isEmpty
              ? "Required field"
              : nameController.text.trim().length < 6
              ? "Name must be at least 6 characters"
              : null;
    });

    if (_formKey.currentState!.validate() &&
        emailError == null &&
        nameError == null &&
        locationError == null) {
      // Save to SharedPreferences when valid
      await SharedPreferenceHelper.savePersonalInfo(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        location: locationController.text.trim(),
      );

      // Navigate to the next screen (Professional Info)
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfessionalInfoScreenView()),
      );
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
          "Personal Information",
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
                        // Full Name Input Field
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Full Name", style: textStyleRegular()),
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          controller: nameController,
                          hintText: 'Name...',
                          prefixIcon: Icons.account_box_rounded,
                          errorText: nameError,
                          isEmail: false,
                        ),
                        SizedBox(height: 20.0),

                        // Email Input Field
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Email", style: textStyleRegular()),
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          controller: emailController,
                          hintText: 'Email...',
                          prefixIcon: Icons.mail_outline_outlined,
                          errorText: emailError,
                          isEmail: true,
                        ),

                        SizedBox(height: 20.0),

                        // Location Input Field
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Location", style: textStyleRegular()),
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          controller: locationController,
                          hintText: 'Location...',
                          prefixIcon: Icons.location_on_outlined,
                          errorText: locationError,
                          isEmail: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // "Next" Button
            Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: GestureDetector(
                    onTap: () {
                      signIn(); // Call the signIn function
                    },
                    child: commonButton(context: context, label: "Next"),
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
