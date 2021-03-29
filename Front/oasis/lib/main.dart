import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oasis/screens/home_screen.dart';
import 'package:oasis/screens/registration_screen.dart';
import 'package:oasis/screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        Registration.id: (context) => Registration(),
        HomeScreen.id: (context) => HomeScreen(),
      },
    );
  }
}
