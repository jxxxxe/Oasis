import 'package:flutter/material.dart';
import 'package:oasis/screens/home_screen.dart';
import 'package:oasis/screens/registration_email.dart';
import 'package:oasis/screens/registration_name.dart';
import 'package:oasis/screens/registration_password.dart';
import 'package:oasis/screens/welcome_screen.dart';
import 'package:oasis/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Welcomescreen.id,
      routes: {
        Welcomescreen.id : (context) => Welcomescreen(),
        Loginscreen.id : (context) => Loginscreen(),
        RegistrationEmail.id : (context) => RegistrationEmail(),
        RegistrationPassword.id : (context) => RegistrationPassword(),
        RegistrationName.id : (context) => RegistrationName(),
        HomeScreen.id : (context) => HomeScreen(),

      },
    );
  }
}
