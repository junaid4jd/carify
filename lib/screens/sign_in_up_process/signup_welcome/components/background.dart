import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../signup_number/signup_number_screen.dart';
import '../sign_in_up_screen.dart';

GlobalKey<ScaffoldState> _scafKey = GlobalKey();

class Background extends StatelessWidget {
  final Widget child;
  String userType;
  Background({
    Key? key,
    required this.child,
    required this.userType,
  }) : super(key: key);

  final ParStyle = const TextStyle(fontSize: 13, color: Colors.white);
  final titles = const TextStyle(
      fontSize: 37, fontWeight: FontWeight.bold, color: Colors.white);
  final buttonText = const TextStyle(
      fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context)
        .size; //provides total height and width of screen for users
    return Scaffold(
      key: _scafKey,
      body: Container(
        height: size.height,
        width: size.width,
        color: Color(0xff00ff00),


        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              width: size.width * 0.9,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_rounded),
                    color: Colors.white, // Color(0xFF00ff00),
                    onPressed: () {
                      Navigator.of(context).pop();
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => SignInUpScreen(
                      //               usertype: 'dummy',
                      //             )));
                    },
                  ),
                ],
              ),
            ),

// // Screen title
            SizedBox(
              height: size.height * 0.05,
            ),

            Align(
              alignment: const Alignment(0.10, -0.60),
              child: Text('Welcome to Carify',
                  style: GoogleFonts.roboto(
                    textStyle: titles,
                  )),
            ),

            //Text
            SizedBox(
              height: size.height * 0.1,
            ),

            Expanded(child: Container()),
// // Sign in Button
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
              child: Text(
                'By Tapping Create Account or Sign In, you agree to our Terms. '
                'Learn how we process your data in our Privacy Policy and Cookie Policy.',
                style: GoogleFonts.roboto(
                  textStyle: ParStyle,
                ),
                textScaleFactor: 1.2,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            SizedBox(
                height: size.height * 0.08,
                width: size.width * 0.9,
                child: TextButton(
                    child: Text("Sign In".toUpperCase(),
                        style: GoogleFonts.roboto(
                          textStyle: buttonText,
                        )),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.all(15)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(28.0),
                                    side: const BorderSide(
                                        color: Colors.white, width: 3)))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpNumberTenant(
                                  userType: userType,
                                )),
                      );
                    })),
            SizedBox(
              height: size.height * 0.03,
            ),
// // Continue Button
            SizedBox(
                height: size.height * 0.08,
                width: size.width * 0.9,
                child: TextButton(
                    child: Text("CONTINUE".toUpperCase(),
                        style: GoogleFonts.roboto(
                          textStyle: buttonText,
                        )),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.all(15)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(28.0),
                                    side: const BorderSide(
                                        color: Colors.white, width: 3)))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SignUpNumberTenant(userType: userType)),
                      );
                    })),
            SizedBox(
              height: size.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
