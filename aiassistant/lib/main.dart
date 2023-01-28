import 'package:aiassistant/screens/Homepage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'auth/LoginScreen.dart';
import 'auth/authentication.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

final auth = Authentication();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  bool _isUserLoggedIn = false;

  Future<bool> getUserLoggedIn() async {
    final SharedPreferences prefs = await _prefs;
    final String? userUid = prefs.getString('userUid');
    print('*****************' + userUid.toString());
    if (userUid != null) {
      setState(() {
        _isUserLoggedIn = true;
      });
      return true;
    } else {
      setState(() {
        _isUserLoggedIn = false;
      });
      return false;
    }
  }

  @override
  void initState() {
    this.getUserLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fitness App',
        color: const Color.fromRGBO(40, 38, 56, 1),
        theme: ThemeData(),
        home: (() {
          if (_isUserLoggedIn) {
            return HomepageScreen();
          } else {
            return LoginScreen();
          }
        }()));
  }
}
