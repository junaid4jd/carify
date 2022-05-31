import 'dart:ui';
import 'package:carify_app/controller/seller_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../address_seller/address_screen_seller.dart';
import '../../date_of_birth_seller/date_of_birth_screen.dart';




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
  final buttonText = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey);
  final Color buttonColor  = const Color(0xFF00ff00);



  @override
  Widget build(BuildContext context) {
    var sellerVM = Provider.of<SellerProvider>(context,listen: false);
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



              // Back arrow
              Positioned(
                top: 105,
                right: 340,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_rounded),
                  color: const Color(0xFF00ff00),
                  onPressed: () {

                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const BirthdayScreenSeller())
                    );
                  },
                ),
              ),



              // Screen title
              Positioned(
                child: Align(
                  alignment: const Alignment(0.10, -0.6),
                  child: Text('My gender is',
                      style: GoogleFonts.roboto (
                        textStyle: titles,
                          fontSize: 44
                      )
                  ),
                ),
              ),



              // Female Button
              Positioned(
                  top: 260,
                  child: SizedBox(
                      height: 54,
                      width: 330,
                      child: TextButton(
                          child: Text("Female".toUpperCase(),  style: GoogleFonts.roboto (
                            textStyle: buttonText,
                          )
                          ),
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(15)),
                              foregroundColor: MaterialStateProperty.all<Color>(Color(0xFF00ff00)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(28.0),
                                      side: const BorderSide(color: Colors.grey, width: 3)
                                  )
                              )
                          ),
                          onPressed: () {
                            sellerVM.changeGender = 'Female';
                            const BorderSide(color: Color(0xFF00ff00));
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const AddressScreenSeller()),
                            );
                          }
                      )
                  )
              ),


              // Male Button
              Positioned(
                  top: 360,
                  child: SizedBox(
                      height: 54,
                      width: 330,
                      child: TextButton(
                          child: Text("Male".toUpperCase(),  style: GoogleFonts.roboto (
                            textStyle: buttonText,
                          )
                          ),
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(15)),
                              foregroundColor: MaterialStateProperty.all<Color>(Color(0xFF00ff00)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(28.0),
                                      side: const BorderSide(color: Colors.grey, width: 3)
                                  )
                              )
                          ),
                          onPressed: () {
                            sellerVM.changeGender = 'Male';
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const AddressScreenSeller()),
                            );
                          }
                      )
                  )
              ),


              // Other Button
              Positioned(
                  top: 460,
                  child: SizedBox(
                      height: 54,
                      width: 330,
                      child: TextButton(
                          child: Text("Other".toUpperCase(),  style: GoogleFonts.roboto (
                            textStyle: buttonText,
                          )
                          ),
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(15)),
                              foregroundColor: MaterialStateProperty.all<Color>(Color(0xFF00ff00)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(28.0),
                                      side: const BorderSide(color: Colors.grey, width: 3)
                                  )
                              )
                          ),
                          onPressed: () {
                            sellerVM.changeGender = 'Other';
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const AddressScreenSeller()),
                            );
                          }
                      )
                  )
              ),


            ],
          ),
        )
    );
  }
}

