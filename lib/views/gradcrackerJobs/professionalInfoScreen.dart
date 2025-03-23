import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus_app/utilities/appColors.dart';
import 'package:graduate_plus_app/utilities/commonButton.dart';
import 'package:graduate_plus_app/utilities/customTextField.dart';
import 'package:graduate_plus_app/utilities/textStyles.dart';
import 'package:graduate_plus_app/views/gradcrackerJobs/gradcrackerJobsScreen.dart';

class ProfessionalInfoScreenView extends StatefulWidget {
  const ProfessionalInfoScreenView({Key? key}) : super(key: key);

  @override
  State<ProfessionalInfoScreenView> createState() =>
      _ProfessionalInfoScreenViewState();
}

class _ProfessionalInfoScreenViewState
    extends State<ProfessionalInfoScreenView> {
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // Key for form validation
  TextEditingController jobController = TextEditingController();
  TextEditingController experienceController = TextEditingController();

  // Error messages for form validation
  String? jobError, experienceError;

  @override
  void initState() {
    super.initState();
    jobController.addListener(() {
      if (jobError != null && jobController.text.isNotEmpty) {
        setState(() {
          jobError = null;
        });
      }
    });
    experienceController.addListener(() {
      if (experienceError != null && experienceController.text.isNotEmpty) {
        setState(() {
          experienceError = null;
        });
      }
    });
  }

  Future<void> signIn() async {
    setState(() {
      jobError = jobController.text.trim().isEmpty ? "Required field" : null;
      experienceError =
          experienceController.text.trim().isEmpty ? "Required field" : null;
    });

    if (_formKey.currentState!.validate() &&
        jobError == null &&
        experienceError == null) {
      try {} on FirebaseAuthException catch (e) {}
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
          "Professional Information",
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
                          child: Text("Job Title", style: textStyleRegular()),
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          controller: jobController,
                          hintText: 'Eg. UI/UX designer...',
                          prefixIcon: Icons.account_box_rounded,
                          errorText: jobError,
                          isEmail: false,
                        ),
                        SizedBox(height: 20.0),

                        // Password Input Field
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Work Experience",
                            style: textStyleRegular(),
                          ),
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          controller: experienceController,
                          hintText: 'Experience...',
                          prefixIcon: Icons.description_outlined,
                          errorText: experienceError,
                          isEmail: false,
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
                      // signIn();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GradcrackerJobsScreen(),
                        ),
                      );
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
