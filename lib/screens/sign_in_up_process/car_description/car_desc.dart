
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../account_type/Account_screen.dart';
import '../date_of_birth_seller/date_of_birth_screen.dart';




class SellerName extends StatefulWidget {
  const SellerName({Key? key}) : super(key: key);

  @override
  _SellerName createState() => _SellerName();
}


class _SellerName extends State<SellerName> {
  final wordButtons = const TextStyle(fontSize: 20, color: Color(0xFFfb7c14));
  final ParStyle = const TextStyle(fontSize: 13, color: Colors.black);
  final titles = const TextStyle(fontSize: 37,  fontWeight: FontWeight.bold, color: Colors.black);
  final buttonText = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white);



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size; //provides total height and width of screen for users
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
      height: size.height,
    width: double.infinity,
    child: Column(
     // alignment: Alignment.center,
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
                color: Color(0xFF00ff00),
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

        SizedBox(height: size.height * 0.05),

        // Back Arro


        // Screen title
        Align(
          alignment: const Alignment(0.10, -0.6),
          child: Text('My full name is',
              style: GoogleFonts.roboto (
                  textStyle: titles,
                  fontSize: 44
              )
          ),
        ),

        SizedBox(height: size.height * 0.05),
        // Text Field
        Align(
            alignment: Alignment(0, -0.30),
            child: Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(70, 0, 70, 0),
                child: TextField(
                    style: TextStyle(fontSize: 18),
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 4),
                        isDense: true,
                        hintText: "John Doe"
                    )),
              ),
            )
        ),

        Expanded(child: Container()),



        // Continue Button
        ElevatedButton(
            child: Text("Continue", style: GoogleFonts.roboto(
                textStyle: buttonText
            )
            ),
            style: ElevatedButton.styleFrom(
                primary: const Color(0xFF00ff00),
                minimumSize: const Size(320, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)
                )
            ),
            onPressed: () { Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BirthdayScreenSeller()),
            );
            }
        ),
        SizedBox(height: size.height * 0.03),

      ],
    ),
    )
    );
  }
}