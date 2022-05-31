import 'package:carify_app/controller/buyer_provider.dart';
import 'package:carify_app/screens/sign_in_up_process/date_of_birth_buyer/birthday_screen_buyer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../buyer_work_status/buyer_work_status.dart';




class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  // Text Styles
  final wordButtons = const TextStyle(fontSize: 20, color: Color(0xFFfb7c14));
  final parStyle = const TextStyle(fontSize: 13, color: Colors.black);
  final titles = const TextStyle(fontSize: 37,  fontWeight: FontWeight.bold, color: Colors.black);
  final buttonText = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey);



  @override
  Widget build(BuildContext context) {
    final buyerData = Provider.of<BuyerProvider>(context);
    Size size = MediaQuery
        .of(context)
        .size; //provides total height and width of screen for users
    return SizedBox(
        height: size.height,
        width: double.infinity,
        child: Scaffold(
          backgroundColor: Colors.white,

          body: Column(
         //   alignment: Alignment.center,
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


              Align(
                alignment: const Alignment(0.10, -0.6),
                child: Text('My Gender is',
                    style: GoogleFonts.roboto (
                      textStyle: titles,
                        fontSize: 44
                    )
                ),
              ),

              SizedBox(height: size.height * 0.08),
              // Female Button
              SizedBox(
                  height: size.height*0.075,
                  width: size.width*0.9,
                  child: TextButton(

                      child: Text("Female".toUpperCase(),  style: GoogleFonts.roboto (
                        textStyle: buttonText,
                      )
                      ),
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(15)),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28.0),
                                  side: const BorderSide(color: Colors.grey, width: 3)
                              )
                          )
                      ),
                      onPressed: () {
                        buyerData.changeGender = 'Female';
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const BuyerWorkStatus()),
                        );
                      }
                  )
              ),
              SizedBox(height: size.height * 0.05),

              // Male Button
              SizedBox(
                  height: size.height*0.075,
                  width: size.width*0.9,
                  child: TextButton(
                      child: Text("Male".toUpperCase(),  style: GoogleFonts.roboto (
                        textStyle: buttonText,
                      )
                      ),
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(15)),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28.0),
                                  side: const BorderSide(color: Colors.grey, width: 3)
                              )
                          )
                      ),
                      onPressed: () {
                        buyerData.changeGender = 'Male';
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const BuyerWorkStatus()),
                        );
                      }
                  )
              ),
              SizedBox(height: size.height * 0.05),

              // Other button
              SizedBox(
                  height: size.height*0.075,
                  width: size.width*0.9,
                  child: TextButton(
                      child: Text("Other".toUpperCase(),  style: GoogleFonts.roboto (
                        textStyle: buttonText,
                      )
                      ),
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(15)),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28.0),
                                  side: const BorderSide(color: Colors.grey, width: 3)
                              )
                          )
                      ),
                      onPressed: () {
                        buyerData.changeGender = 'Other';
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const BuyerWorkStatus()),
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

