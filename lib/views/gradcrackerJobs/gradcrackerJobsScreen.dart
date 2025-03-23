import 'package:flutter/material.dart';
import 'package:graduate_plus_app/utilities/appColors.dart';
import 'package:graduate_plus_app/utilities/models/jobsModel.dart';

class GradcrackerJobsScreen extends StatelessWidget {
  final List<JobsModel> jobs = [
    JobsModel(
      title: "Graduate Civil Design Engineer",
      category: "Structural, Construction, Civil...",
      salary: "£39,700",
      location: "London",
      degree: "All Grades",
      starting: "September 2024",
      deadline: "April 10th, 2025",
    ),
    JobsModel(
      title: "Assistant Design Coordinator",
      category: "Architecture, Construction Management.",
      salary: "Competitive + benefits",
      location: "London",
      degree: "2:1 and above",
      starting: "September 2024",
      deadline: "April 10th, 2025",
    ),
    JobsModel(
      title: "Software Engineer Industrial Placement",
      category: "Software, Computer Science, Physics, Chemistry, Maths.",
      salary: "£24,961 + benefits",
      location: "Didcot (Oxfordshire)",
      degree: "2:1 and above",
      starting: "September 2025",
      deadline: "March 2nd, 2025",
    ),
    JobsModel(
      title: "Graduate Civil Design Engineer",
      category: "Structural, Construction, Civil...",
      salary: "£39,700",
      location: "London",
      degree: "All Grades",
      starting: "September 2024",
      deadline: "April 10th, 2025",
    ),
  ];

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
          "Jobs",
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListView.builder(
          itemCount: jobs.length,
          itemBuilder: (context, index) {
            return JobCard(job: jobs[index]);
          },
        ),
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  final JobsModel job;
  const JobCard({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: whiteColor,
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              job.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: appThemeColor,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              job.category,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: blackColor.withOpacity(.9),
              ),
            ),
            const SizedBox(height: 8),
            JobDetailRow(label: "Salary:", value: job.salary),
            JobDetailRow(label: "Location:", value: job.location),
            JobDetailRow(label: "Degree Required:", value: job.degree),
            JobDetailRow(label: "Starting:", value: job.starting),
            JobDetailRow(label: "Deadline:", value: job.deadline),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "View Details",
                style: TextStyle(color: appThemeColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class JobDetailRow extends StatelessWidget {
  final String label;
  final String value;
  const JobDetailRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: RichText(
        text: TextSpan(
          text: "$label ",
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          children: [
            TextSpan(
              text: value,
              style: const TextStyle(fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
