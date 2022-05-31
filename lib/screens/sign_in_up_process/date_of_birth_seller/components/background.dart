
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../gender_type_seller/gender_screen_landlord.dart';
import '../../name_info_seller/name_seller_screen.dart';



class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  // Text Styles
  final wordButtons = const TextStyle(fontSize: 20, color: Color(0xFF00ff00));
  final ParStyle = const TextStyle(fontSize: 13, color: Colors.black);
  final titles = const TextStyle(fontSize: 37,  fontWeight: FontWeight.bold, color: Colors.black);
  final buttonText = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white);



  @override
  Widget build(BuildContext context) {
    final format = DateFormat('MM-dd-yyyy');
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

//ff
              // Back Button
              Positioned(
                top: 105,
                right: 340,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_rounded),
                  color: const Color(0xFF00ff00),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SellerName())
                    );
                  },
                ),
              ),


              // Screen title
              Positioned(
                child: Align(
                  alignment: const Alignment(0.10, -0.6),
                  child: Text('My birthday is',
                      style: GoogleFonts.roboto (
                        textStyle: titles,
                          fontSize: 44
                      )
                  ),
                ),
              ),


              // Birthday  Input
              //  Positioned(
              //     child: Align(
              //         alignment: Alignment(0, -0.30),
              //         child: Padding(
              //           padding: EdgeInsets.fromLTRB(70, 0, 70, 0),
              //           child: TextField(
              //               style: TextStyle(fontSize: 18),
              //               keyboardType: TextInputType.name,
              //               inputFormatters: <TextInputFormatter>[
              //                 FilteringTextInputFormatter.allow(RegExp("[0-9 ]+")),
              //               ],
              //               decoration: InputDecoration(
              //                   contentPadding: EdgeInsets.only(bottom: 4),
              //                   isDense: true,
              //                   hintText: "DD - MM - YYYY"
              //               )
              //           ),
              //         )
              //     )
              // ),
              Positioned(
                  child: Align(
                      alignment: Alignment(0, -0.30),
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(70, 0, 70, 0),
                          child: DateTimeField(
                              // controller: birthdayController,
                              format: format,
                              decoration: InputDecoration(
                                // contentPadding: EdgeInsets.only(bottom: 1),
                                  isDense: true,
                                  hintText: "DD - MM - YYYY"
                              ),
                              onShowPicker: (context, currentValue) async {
                                final date = showDatePicker(
                                    context: context,
                                    initialDate: currentValue ?? DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2023));
                                return date;
                              })
                        // TextField(
                        //     style: TextStyle(fontSize: 18),
                        //     controller: birthdayController,
                        //     keyboardType: TextInputType.name,
                        //     inputFormatters: <TextInputFormatter>[
                        //       FilteringTextInputFormatter.allow(RegExp("[0-9 ]+")),
                        //     ], // Onl
                        //     decoration: InputDecoration(
                        //         contentPadding: EdgeInsets.only(bottom: 4),
                        //         isDense: true,
                        //         hintText: "DD - MM - YYYY"
                        //     )
                        // ),
                      ))),

              // Text
              Positioned(
                child: Align(
                  alignment: const Alignment(-0.37, -0.20),
                  child: Text('Your age will be shown',
                      style: GoogleFonts.roboto (
                          textStyle: ParStyle,
                          fontSize: 16,
                          color: const Color(0xFF757575)
                      )
                  ),
                ),
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
                        MaterialPageRoute(builder: (context) => const GenderScreenSeller()),
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