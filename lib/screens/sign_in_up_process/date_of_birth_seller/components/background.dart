
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

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
                      //Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                              SellerName()
                          ));
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: size.height * 0.05),
            // Back Button
            // Screen title
            Align(
              alignment: const Alignment(0.10, -0.6),
              child: Text('My birthday is',
                  style: GoogleFonts.roboto (
                    textStyle: titles,
                      fontSize: 44
                  )
              ),
            ),
            SizedBox(height: size.height * 0.05),

            // Birthday  Input
             Align(
                 alignment: Alignment(0, -0.30),
                 child: Padding(
                   padding: EdgeInsets.fromLTRB(70, 0, 70, 0),
                   child: TextField(
                       style: TextStyle(fontSize: 18),
                       keyboardType: TextInputType.name,
                       inputFormatters: <TextInputFormatter>[
                         FilteringTextInputFormatter.allow(RegExp("[0-9 ]+")),
                       ],
                       decoration: InputDecoration(
                           contentPadding: EdgeInsets.only(bottom: 4),
                           isDense: true,
                           hintText: "DD - MM - YYYY"
                       )
                   ),
                 )
             ),

            SizedBox(height: size.height * 0.025),
            // Text
            Align(
              alignment: const Alignment(-0.37, -0.20),
              child: Text('Your age will be shown',
                  style: GoogleFonts.roboto (
                      textStyle: ParStyle,
                      fontSize: 16,
                      color: const Color(0xFF757575)
                  )
              ),
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
                  MaterialPageRoute(builder: (context) => const GenderScreenSeller()),
                );
                }
            ),
            SizedBox(height: size.height * 0.05),

          ],
        ),
      ),
    );
  }
}