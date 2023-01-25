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

  static Future setNewUser(String uid, String email, String password,
      String name, String surname, int weight) async {
    try {
      await db.collection('users').doc(uid).set({
        'email': email,
        'name': name,
        'surname': surname,
        'weight': weight,
        'type': 'user'
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}
