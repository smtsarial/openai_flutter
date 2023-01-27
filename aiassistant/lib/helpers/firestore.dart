import 'package:aiassistant/models/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreHelper {
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  static Future<User> getMyData(String uid) async {
    try {
      final DocumentSnapshot result =
          await db.collection('users').doc(uid).get();
      final User user = User.fromJson(result.data() as Map<String, dynamic>);

      return user;
    } catch (e) {
      return User();
    }
  }

  static Future<bool> checkUserHasAvaliable(String userId) async {
    try {
      //get today user UserMessages collection and check if there are 3 or more messages
      //if there are 3 or more messages return false
      //if there are less than 3 messages return true
      final QuerySnapshot result = await db
          .collection('users')
          .doc(userId)
          .collection('UserMessages')
          .where('time',
              isGreaterThanOrEqualTo:
                  DateTime.now().subtract(Duration(days: 1)))
          .get();
      if (result.docs.length >= 3) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      return false;
    }
  }

  static Future saveUserMessage(
      String uid, String prompt, String response) async {
    try {
      await db.collection('users').doc(uid).collection('UserMessages').add(
          {'request': prompt, 'response': response, 'time': DateTime.now()});
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future setNewUser(String uid, String email, String password,
      String name, String surname) async {
    try {
      await db.collection('users').doc(uid).set(
          {'email': email, 'name': name, 'surname': surname, 'type': 'user'});
      return true;
    } catch (e) {
      return false;
    }
  }
}
