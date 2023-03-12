import 'package:aiassistant/constants.dart';
import 'package:aiassistant/screens/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'auth/LoginScreen.dart';
import 'auth/authentication.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

final auth = Authentication();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await Purchases.configure(PurchasesConfiguration(appleApiKey));
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
  bool _permissionError = false;

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
    // this.getUserLoggedIn();
    this.initilize();
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
          if (_permissionError) {
            return Scaffold(
                resizeToAvoidBottomInset: true,
                backgroundColor: const Color.fromRGBO(40, 38, 56, 1),
                body: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'Please enable app permissions.',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            openAppSettings();
                          },
                          child: Text('Open App Settings')),
                    ],
                  ),
                ));
          } else {
            return HomepageScreen();
            // if (_isUserLoggedIn) {
            //   return HomepageScreen();
            // } else {
            //   return LoginScreen();
            // }
          }
        }()));
  }

  void initilize() async {
    while (await Permission.appTrackingTransparency.request().isDenied) {
      await Future.delayed(Duration(seconds: 1));
      await Permission.appTrackingTransparency.request().then((value) {
        if (value == PermissionStatus.granted) {
          Purchases.setAllowSharingStoreAccount(true);
          setState(() {
            _permissionError = false;
          });
        } else {
          setState(() {
            _permissionError = false;
          });
        }
      });
    }
  }
}
