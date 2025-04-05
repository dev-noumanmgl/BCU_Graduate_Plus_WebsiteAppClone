import 'package:flutter/material.dart';
import 'package:graduate_plus_app/sharedPreference/sharedPreferenceforJobSection.dart';
import 'package:url_launcher/url_launcher.dart';

class GradcrackerJobsScreen extends StatefulWidget {
  const GradcrackerJobsScreen({Key? key}) : super(key: key);

  @override
  _GradcrackerJobsScreenState createState() => _GradcrackerJobsScreenState();
}

class _GradcrackerJobsScreenState extends State<GradcrackerJobsScreen> {
  String? jobTitle;
  String? location;
  String? experience;
  bool _isLoading = true; // Track loading state

  @override
  void initState() {
    super.initState();
    _loadStudentData();
  }

  // Load student's job title, location, and experience from SharedPreferences
  Future<void> _loadStudentData() async {
    String? job = await SharedPreferenceHelper.getJob();
    String? loc = await SharedPreferenceHelper.getLocation();
    String? exp = await SharedPreferenceHelper.getExperience();

    setState(() {
      jobTitle = job;
      location = loc;
      experience = exp;
      _isLoading = false; // Data is loaded, stop loading state
    });

    // After data is loaded, automatically launch URL
    if (jobTitle != null && location != null && experience != null) {
      _launchGradcrackerUrl();
    }
  }

  // Build the Gradcracker URL and launch it using in-app WebView
  Future<void> _launchGradcrackerUrl() async {
    final String urlString =
        'https://www.gradcracker.com/keyword-search?query=${Uri.encodeComponent(experience!)}&degree-apprenticeships=1&placements=0&jobs=1&employers=1&location=${Uri.encodeComponent(location!)}&jobTitle=${Uri.encodeComponent(jobTitle!)}';
    final Uri url = Uri.parse(urlString);

    if (await launchUrl(url, mode: LaunchMode.inAppWebView)) {
      // If the URL is successfully launched, pop the current screen
      Navigator.pop(context); // Close GradcrackerJobsScreen
    } else {
      throw 'Could not launch $urlString';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          _isLoading
              ? const Center(
                child: CircularProgressIndicator(),
              ) // Show progress indicator while loading
              : Container(), // Empty container when not loading
    );
  }
}
