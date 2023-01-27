import 'package:aiassistant/auth/authentication.dart';
import 'package:aiassistant/main.dart';
import 'package:aiassistant/screens/Homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignupPage();
}

class _SignupPage extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromRGBO(40, 38, 56, 1),
      body: SignupPageContent(),
    );
  }
}

class SignupPageContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignupPageContent();
}

class _SignupPageContent extends State<SignupPageContent> {
  TextEditingController nameController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController1 = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();
  bool _isVisible = false;
  bool _isObscure1 = true;
  bool _isObscure2 = true;
  String returnVisibilityString = "";
  Authentication auth = Authentication();

  bool returnVisibility(String password1, String password2, String username) {
    if (password1 != password2) {
      returnVisibilityString = "Passwords do not match";
    } else if (username == "") {
      returnVisibilityString = "Username cannot be empty";
    } else if (password1 == "" || password2 == "") {
      returnVisibilityString = "Password fields cant be empty";
    } else if (!auth.isPasswordCompliant(password1)) {
      returnVisibilityString = "Not password compliant";
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 150,
            width: 400,
          ),
          Center(
            child: Container(
              width: 400,
              alignment: Alignment.center,
              child: Text(
                "Sign up",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
            width: 400,
          ),
          // Wrong password text
          Visibility(
            visible: _isVisible,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(10),
              child: Text(
                returnVisibilityString,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 15,
                ),
              ),
            ),
          ),

          // Signup Info
          SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    onTap: () {
                      setState(() {
                        _isVisible = false;
                      });
                    },
                    keyboardType: TextInputType.text,
                    controller: nameController, // Controller for Username
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        focusColor: Colors.white,
                        hintText: "Name",
                        contentPadding: EdgeInsets.all(20)),
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
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
                    keyboardType: TextInputType.text,
                    controller: surnameController, // Controller for Username
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Surname",
                        contentPadding: EdgeInsets.all(20)),
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
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
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController, // Controller for Username
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email",
                        contentPadding: EdgeInsets.all(20)),
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
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
                    controller: passwordController1, // Controller for Password
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                        contentPadding: EdgeInsets.all(20),
                        // Adding the visibility icon to toggle visibility of the password field
                        suffixIcon: IconButton(
                          icon: Icon(_isObscure1
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _isObscure1 = !_isObscure1;
                            });
                          },
                        )),
                    obscureText: _isObscure1,
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

                    controller: passwordController2, // Controller for Password
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Re-enter Password",
                        contentPadding: EdgeInsets.all(20),
                        // Adding the visibility icon to toggle visibility of the password field
                        suffixIcon: IconButton(
                          icon: Icon(_isObscure2
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _isObscure2 = !_isObscure2;
                            });
                          },
                        )),
                    obscureText: _isObscure2,
                  ),
                ],
              ),
            ),
          ),

          // Signup Submit button
          Container(
            width: 570,
            height: 70,
            padding: EdgeInsets.only(top: 20),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text("Submit", style: TextStyle(color: Colors.white)),
                onPressed: () async {
                  if (kDebugMode) {
                    print(
                        "Username: ${emailController.text}\npassword: ${passwordController1.text}\nretry password ${passwordController2.text}");
                  }

                  if (emailController.text != "" &&
                      passwordController1.text == passwordController2.text &&
                      passwordController2.text != "" &&
                      auth.isPasswordCompliant(passwordController1.text)) {
                    await auth
                        .signUp(
                      emailController.text,
                      passwordController1.text,
                      nameController.text,
                      surnameController.text,
                    )
                        .then((value) {
                      if (!value) {
                        setState(() {
                          returnVisibilityString =
                              "Error occured during the process.";
                          _isVisible = true;
                        });
                      } else {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomepageScreen()),
                          (Route<dynamic> route) => false,
                        );
                      }
                    });
                  } else {
                    setState(() {
                      _isVisible = returnVisibility(passwordController1.text,
                          passwordController2.text, emailController.text);
                    });
                  }
                }),
          ),
        ],
      ),
    );
  }
}
