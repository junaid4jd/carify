import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'background.dart';


class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  final ParStyle = const TextStyle(fontSize: 62, fontWeight: FontWeight.bold);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size; //provides total height and width of screen for users
    return Background(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.05),

          ]
      ),
    );
  }
}
