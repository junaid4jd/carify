import 'package:carify_app/configuration/size_config.dart';
import 'package:carify_app/constants/app_colors.dart';
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
  final titles = const TextStyle(fontSize: 37, fontWeight: FontWeight.bold, color: Colors.white);
  final buttonText = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColors.kAppPrimaryColors,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            color: const Color(0xFF00ff00),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SignInUpScreen(
                            usertype: 'dummy',
                          )));
            },
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.06),
          Text('Welcome to Carify',
              style: GoogleFonts.roboto(
                textStyle: titles,
              )),
          SizedBox(height: SizeConfig.screenHeight! * 0.27),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth! * 0.07),
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
          SizedBox(height: SizeConfig.screenHeight! * 0.2),
          Container(
            width: SizeConfig.screenWidth! * 0.9,
            height: SizeConfig.screenHeight! * 0.074,
            child: TextButton(
                child: Text("Sign In".toUpperCase(),
                    style: GoogleFonts.roboto(
                      textStyle: buttonText,
                    )),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(15)),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28.0),
                        side: const BorderSide(color: Colors.white, width: 3)))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SignUpNumberTenant(
                              userType: userType,
                            )),
                  );
                }),
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.03),
          Container(
            width: SizeConfig.screenWidth! * 0.9,
            height: SizeConfig.screenHeight! * 0.074,
            child: TextButton(
                child: Text("CONTINUE".toUpperCase(),
                    style: GoogleFonts.roboto(
                      textStyle: buttonText,
                    )),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(15)),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28.0),
                        side: const BorderSide(color: Colors.white, width: 3)))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpNumberTenant(userType: userType)),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
