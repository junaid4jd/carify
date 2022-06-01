
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    return SizedBox(
        height: size.height,
        width: double.infinity,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            alignment: Alignment.center,
            children: <Widget>[


              // Back Arrow
              Positioned(
                top: 105,
                right: 340,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_rounded),
                  color: const Color(0xFF00ff00),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>   AccountType())
                    );
                  },
                ),
              ),


              // Screen title
              Positioned(
                child: Align(
                  alignment: const Alignment(0.10, -0.6),
                  child: Text('My full name is',
                      style: GoogleFonts.roboto (
                          textStyle: titles,
                          fontSize: 44
                      )
                  ),
                ),
              ),


              // Text Field
               Positioned(
                  child: Align(
                      alignment: Alignment(0, -0.30),
                      child: Expanded(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(70, 0, 70, 0),
                          child: TextField(
                              style: TextStyle(fontSize: 18),
                              keyboardType: TextInputType.text,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]+")),
                              ],
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(bottom: 4),
                                  isDense: true,
                                  hintText: "Full Name"
                              )),
                        ),
                      )
                  )
              ),






              // Continue Button
              Positioned(
                  top: 660,
                  child: ElevatedButton(
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
                  )
              ),


            ],
          ),
        )
    );
  }
}