import 'package:firebase_database/firebase_database.dart';
import 'package:graduate_plus_app/utilities/models/studentPrsnlInfoModel.dart';

Future<StudentPrsnlInfoModel?> getUserPersonalInfoFromDatabase(
  String uid,
) async {
  DatabaseReference databaseReference = FirebaseDatabase.instance.ref().child(
    'users/$uid',
  );

  try {
    DataSnapshot snapshot = await databaseReference.get();
    if (snapshot.exists) {
      // Explicitly casting snapshot value to a Map<dynamic, dynamic>
      Map<dynamic, dynamic> userInfoMap = Map<dynamic, dynamic>.from(
        snapshot.value as Map,
      );
      StudentPrsnlInfoModel userPersonalInfo = StudentPrsnlInfoModel.fromMap(
        userInfoMap,
      );
      return userPersonalInfo;
    } else {
      // Handle case where the user info does not exist.
      print('User information does not exist.');
      return null;
    }
  } catch (e) {
    // Handle any errors that occur during the fetch operation
    print('Error fetching user information: $e');
    return null;
  }
}
