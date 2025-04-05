import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus_app/sharedPreference/sharedPreferenceHelper.dart';
import 'package:graduate_plus_app/sharedPreference/sharedPreferenceforJobSection.dart';
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
    _loadSavedData();
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

  // Load saved data from SharedPreferences
  void _loadSavedData() async {
    // You can load saved job and experience info from SharedPreferences here
    jobController.text = await SharedPreferenceHelper.getJob() ?? '';
    experienceController.text =
        await SharedPreferenceHelper.getExperience() ?? '';
  }

  Future<void> saveProfessionalInfo() async {
    setState(() {
      jobError = jobController.text.trim().isEmpty ? "Required field" : null;
      experienceError =
          experienceController.text.trim().isEmpty ? "Required field" : null;
    });

    if (_formKey.currentState!.validate() &&
        jobError == null &&
        experienceError == null) {
      // Save to SharedPreferences when valid
      await SharedPreferenceHelper.saveProfessionalInfo(
        jobTitle: jobController.text.trim(),
        experience: experienceController.text.trim(),
      );

      // Navigate to the next screen (Gradcracker Jobs)
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => GradcrackerJobsScreen()),
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
                        // Job Title Input Field
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

                        // Work Experience Input Field
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

            // "Next" Button
            Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: GestureDetector(
                    onTap: () {
                      saveProfessionalInfo(); // Save and move to next screen
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
