import 'package:chat_try_34/screens/home_screen.dart';
import 'package:chat_try_34/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (_auth.currentUser != null) {
            return HomeScreen();
          } else {
            return LoginScreen();
          }
        });
  }
}
