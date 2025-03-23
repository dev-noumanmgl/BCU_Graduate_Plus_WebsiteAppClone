class JobsModel {
  final String title;
  final String category;
  final String salary;
  final String location;
  final String degree;
  final String starting;
  final String deadline;

  JobsModel({
    required this.title,
    required this.category,
    required this.salary,
    required this.location,
    required this.degree,
    required this.starting,
    required this.deadline,
  });

  // Factory method to create a Job from a Map (useful for JSON parsing)
  factory JobsModel.fromMap(Map<String, String> map) {
    return JobsModel(
      title: map["title"] ?? "",
      category: map["category"] ?? "",
      salary: map["salary"] ?? "",
      location: map["location"] ?? "",
      degree: map["degree"] ?? "",
      starting: map["starting"] ?? "",
      deadline: map["deadline"] ?? "",
    );
  }

  // Convert Job object to a Map (useful for JSON serialization)
  Map<String, String> toMap() {
    return {
      "title": title,
      "category": category,
      "salary": salary,
      "location": location,
      "degree": degree,
      "starting": starting,
      "deadline": deadline,
    };
  }
}
