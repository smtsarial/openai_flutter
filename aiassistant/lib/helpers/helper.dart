import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<bool> getUserLoggedIn() async {
    final SharedPreferences prefs = await _prefs;
    final String? userUid = prefs.getString('userUid');
    print('*****************' + userUid.toString());
    if (userUid != null) {
      return true;
    } else {
      return false;
    }
  }
}
