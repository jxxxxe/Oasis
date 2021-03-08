import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oasis/screens/registration_password.dart';

class RegistrationEmail extends StatelessWidget {
  static String id = 'registration_email';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(
                top: MediaQuery.of(context).padding.top,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Stack(
                children: [
                  FlatButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 40,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:5.0,),
                    child: Center(
                      child: Text(
                        'Registration',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 30.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Please Enter your Email',
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          'Required for login or create an account',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 90, 0),
                    child: TextField(
                      onChanged: (value) {
                        //Do something with the user input.
                      },
                      decoration: InputDecoration(
                          hintText: 'abcdefg1234@oasis.com',
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: SizedBox(),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
                  child: Material(
                    elevation: 5.0,
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10.0),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RegistrationPassword.id);
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'Continue',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
