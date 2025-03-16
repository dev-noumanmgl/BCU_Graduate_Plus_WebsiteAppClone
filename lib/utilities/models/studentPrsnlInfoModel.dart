class StudentPrsnlInfoModel {
  String? profileImage;
  String? userFullName;
  String? userEmail;
  String? userId;
  String? userPassword;
  String? accountCreatedDate;

  StudentPrsnlInfoModel({
    this.profileImage,
    this.userFullName,
    this.userEmail,
    this.userId,
    this.accountCreatedDate,
    this.userPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      "profileImage": profileImage,
      "userFullName": userFullName,
      "userEmail": userEmail,
      "userId": userId,
      "accountCreatedDate": accountCreatedDate,
      "userPassword": userPassword,
    };
  }

  factory StudentPrsnlInfoModel.fromMap(Map<dynamic, dynamic> map) {
    return StudentPrsnlInfoModel(
      profileImage: map["profileImage"],
      userFullName: map["userFullName"],
      userEmail: map["userEmail"],
      userId: map["userId"],
      accountCreatedDate: map["accountCreatedDate"],
      userPassword: map["userPassword"],
    );
  }
}
