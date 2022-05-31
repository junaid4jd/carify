import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../sign_in_up_process/address_buyer/address_screen_buyer.dart';






class AddressBuyerScreenUpdate extends StatefulWidget {
  const AddressBuyerScreenUpdate({Key? key}) : super(key: key);

  @override
  State<AddressBuyerScreenUpdate> createState() => _AddressBuyerScreenUpdateState();
}

// Text Styles
final wordButtons =  const TextStyle(fontSize: 20, color: Color(0xFFfb7c14));
final ParStyle = const TextStyle(fontSize: 13, color: Colors.black);
final titles = const TextStyle(fontSize: 37,  fontWeight: FontWeight.bold, color: Colors.black);
final buttonText = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white);

class _AddressBuyerScreenUpdateState extends State<AddressBuyerScreenUpdate> {
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
                  onPressed: () {Navigator.of(context).pop();
                  },
                ),
              ),



              // Screen title
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.only(left:50,right:50),
                  child: Align(
                    alignment: const Alignment(0.0, -0.6),
                    child: Text('My address is',
                      style: GoogleFonts.roboto (
                        textStyle: titles,
                        fontSize: 44,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),


              // Text Field
              const Positioned(
                  child: Align(
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
                                  hintText: "69420 Richmond St"
                              )),
                        ),
                      )
                  )
              ),


              // Text
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.only(left: 70,right:100),
                  child: Align(
                    alignment: const Alignment(0.0, -0.20),
                    child: Text('This will help us find cars near you',
                        style: GoogleFonts.roboto (
                            textStyle: ParStyle,
                            fontSize: 16,
                            color: const Color(0xFF757575)
                        )
                    ),
                  ),
                ),
              ),



              // Continue Button
              Positioned(
                  top: 660,
                  child: ElevatedButton(
                      child: Text("Update my school", style: GoogleFonts.roboto(
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
                        MaterialPageRoute(builder: (context) => const AddressScreenBuyer()),
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
