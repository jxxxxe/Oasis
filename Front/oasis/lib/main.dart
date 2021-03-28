import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oasis/screens/home_screen.dart';
import 'package:oasis/screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

bool isItFirstData = true;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return MaterialApp(
        home: StreamBuilder<User>(
            stream: FirebaseAuth.instance.onAuthStateChanged,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return HomeScreen();
              }
              return WelcomeScreen();
            }));
  }
}
