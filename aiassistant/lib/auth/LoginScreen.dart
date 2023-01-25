import 'package:aiassistant/auth/SignUpScreen.dart';
import 'package:aiassistant/auth/authentication.dart';
import 'package:aiassistant/main.dart';
import 'package:aiassistant/screens/Homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;
  bool _isVisible = false;
  bool _isLoading = false;

  Authentication auth = Authentication();

  final TapGestureRecognizer _gestureRecognizer = TapGestureRecognizer()
    ..onTap = () {
      if (kDebugMode) {}
    };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromRGBO(40, 38, 56, 1),
      body: SingleChildScrollView(
          reverse: true,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 60,
                width: 200,
              ),

              // Login text Widget
              Center(
                child: Container(
                  height: 200,
                  width: 400,
                  alignment: Alignment.center,
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                    // textAlign: TextAlign.center,
                  ),
                ),
              ),

              SizedBox(
                height: 60,
                width: 10,
              ),

              // Wrong Password text
              Visibility(
                visible: _isVisible,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Wrong credentials entered",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),

              // Textfields for username and password fields
              Container(
                height: 140,
                width: 530,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      onTap: () {
                        setState(() {
                          _isVisible = false;
                        });
                      },
                      controller: emailController, // Controller for Username
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Email",
                          contentPadding: EdgeInsets.all(20)),
                      onEditingComplete: () =>
                          FocusScope.of(context).nextFocus(),
                    ),
                    Divider(
                      thickness: 3,
                    ),
                    TextFormField(
                      onTap: () {
                        setState(() {
                          _isVisible = false;
                        });
                      },

                      controller: passwordController, // Controller for Password
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
                          contentPadding: EdgeInsets.all(20),
                          // Adding the visibility icon to toggle visibility of the password field
                          suffixIcon: IconButton(
                            icon: Icon(_isObscure
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          )),
                      obscureText: _isObscure,
                    ),
                  ],
                ),
              ),

              // Submit Button
              Container(
                width: 570,
                height: 70,
                padding: EdgeInsets.only(top: 20),
                child: _isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.orange,
                          color: Colors.black,
                          strokeWidth: 8,
                        ),
                      )
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                        ),
                        child: Text("Submit",
                            style: TextStyle(color: Colors.white)),
                        onPressed: () async {
                          setState(() {
                            _isLoading = true;
                          });
                          await auth
                              .login(
                                  emailController.text, passwordController.text)
                              .then((value) {
                            if (value != 'error') {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomepageScreen()),
                                (Route<dynamic> route) => false,
                              );
                            } else {
                              setState(() {
                                _isVisible = true;
                              });
                            }
                          });

                          setState(() {
                            _isLoading = false;
                          });
                        }),
              ),

              // Register
              Container(
                  padding: EdgeInsets.only(top: 40, left: 20, right: 20),
                  child: Center(
                      child: RichText(
                    text: TextSpan(
                      text: "Dont have an account? ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      children: [
                        TextSpan(
                            text: " Register here",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                            recognizer: new TapGestureRecognizer()
                              ..onTap = () => {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignupPage()),
                                    )
                                  }),
                      ],
                    ),
                  )))
            ],
          )),
    );
  }
}
