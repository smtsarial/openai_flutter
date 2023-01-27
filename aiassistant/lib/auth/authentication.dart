import 'package:aiassistant/helpers/firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

var _email = ["a"];
var _password = ["a"];
int _i = 1;

class Authentication {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static final FirebaseFirestore db = FirebaseFirestore.instance;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<String> login(String email, String password) async {
    try {
      final SharedPreferences prefs = await _prefs;
      UserCredential userCredentials = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      User? user = userCredentials.user;
      print('ASFDKAJSKLFJASF' + user.toString());
      prefs.setString('userUid', user!.uid);
      //if user not null return user uid and if not return error string
      return user != null ? user.uid : "error";
    } catch (e) {
      return "error";
    }
  }

  Future<bool> signUp(String email, String password, String name,
      String surname) async {
    final SharedPreferences prefs = await _prefs;
    try {
      print('object');
      UserCredential userCredentials = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredentials.user;
      print('object' + user.toString());
      await FirestoreHelper.setNewUser(
          user!.uid, email, password, name, surname);
      prefs.setString('userUid', user.uid);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  Future<void> deleteAccount() async {
    try {
      _firebaseAuth.currentUser!.delete();
    } catch (e) {
      print(e);
    }
  }

  Future<String?> getUser() async {
    User? user = await _firebaseAuth.currentUser;
    return user?.email;
  }

  Future<bool> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email).then((value) {
        value;
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  bool fetchCredentials(String email, String password) {
    for (var j = 0; j < _email.length; j++) {
      if (email == _email[j] && password == _password[j]) {
        return true;
      }
    }
    return false;
  }

  bool checkUserRepeat(username) {
    for (var j = 0; j < _email.length; j++) {
      if (username == _email[j]) {
        print(username);
        return true;
      }
    }
    return false;
  }

  void insertCredentials(username, password) {
    _email.add(username);
    _password.add(password);
    _i++;
  }

  bool isPasswordCompliant(String password, [int minLength = 6]) {
    if (password.isEmpty) {
      return false;
    }

    bool hasUppercase = password.contains(new RegExp(r'[A-Z]'));
    bool hasDigits = password.contains(new RegExp(r'[0-9]'));
    bool hasLowercase = password.contains(new RegExp(r'[a-z]'));
    bool hasSpecialCharacters =
        password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    bool hasMinLength = password.length > minLength;

    return true;
  }
}
