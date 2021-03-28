import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:oasis/screens/home_screen.dart';
import 'package:oasis/screens/registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  TextEditingController _mailCon = TextEditingController();
  TextEditingController _pwCon = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _mailCon.dispose();
    _pwCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/background_image.png'),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 20,
              ),
              Center(child: Image.asset('images/logo.png')),
              SizedBox(
                height: 100.0,
              ),
              TextField(
                controller: _mailCon,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter your Email',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlue, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _pwCon,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Enter your Password',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlue, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: Material(
                  elevation: 5.0,
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(10.0),
                  child: MaterialButton(
                    onPressed: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: _mailCon.text, password: _pwCon.text);
                        if (user != null) {
                          Navigator.pushNamed(context, HomeScreen.id);
                        }

                        setState(() {
                          showSpinner = false;
                        });
                      } catch (e) {
                        print(e);
                      }
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'Log In',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 80,
                    height: 40,
                    child: Divider(
                      thickness: 1,
                      color: Colors.deepOrange,
                    ),
                  ),
                  Text(
                    '   OR   ',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 10,
                    ),
                  ),
                  SizedBox(
                    width: 80,
                    height: 40,
                    child: Divider(
                      thickness: 1,
                      color: Colors.deepOrange,
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
                child: Material(
                  elevation: 5.0,
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(10.0),
                  child: MaterialButton(
                    onPressed: signInWithGoogle,
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'LogIn with Google',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationEmail.id);
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.lightBlueAccent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    if (googleUser != null) {
      Navigator.pushNamed(context, HomeScreen.id);
    }
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
