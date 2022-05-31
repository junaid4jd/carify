
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

import '../add_cars/add_cars_screen.dart';
import '../car_details_seller/car_details_screen.dart';



class FeaturesSeller extends StatefulWidget {
  const FeaturesSeller({Key? key}) : super(key: key);

  @override
  _FeaturesSellerState createState() => _FeaturesSellerState();
}


class _FeaturesSellerState extends State<FeaturesSeller> {


  int selectedValue = 0;
  final wordButtons = const TextStyle(
      fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF424242));
  final smallText = const TextStyle(
      fontSize: 13,  color: Color(0xFF424242));
  final titles = const TextStyle(
      fontSize: 37, fontWeight: FontWeight.bold, color: Colors.black);
  final buttonText = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white);




  @override
  Widget build(BuildContext context) {
    Size size =
        MediaQuery
            .of(context)
            .size; //provides total height and width of scr
    return Scaffold(
      backgroundColor: Colors.white,


      body: SingleChildScrollView(



          child: Column(
             // alignment: Alignment.center,
              children: <Widget>[
                // Container(
                //   height: 800,
                // ),


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
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const CarDetailsSeller())
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),


                // Screen Title Text
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: Align(
                    alignment: const Alignment(0.0, -0.6),
                    child: Text(
                      'Included\n features',
                      style: GoogleFonts.roboto(
                        textStyle: titles,
                        fontSize: 44,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                SizedBox(
                  height: size.height * 0.03,
                ),
                // # of bedrooms
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: Align(
                    alignment: const Alignment(0.0, -0.6),
                    child: Text('Let us know what features are included\n in your car. Selected features will\n be shown as included with your car',
                      style: GoogleFonts.roboto(
                        textStyle: smallText,

                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),

                Container(
                  height: size.height*0.07,
                  width: size.width*0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customCheckbox(
                        text: "Push to start",
                      ),

                      // Check Parking
                      customCheckbox(
                        text: "Wifi",
                      ),
                    ],
                  ),
                ),
                // Check Utilities

                SizedBox(
                  height: size.height * 0.015,
                ),

                Container(
                  height: size.height*0.07,
                  width: size.width*0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customCheckbox(
                        text: "bluetooth",
                      ),

                      // Check Laundry
                      customCheckbox(
                        text: "touch screen",
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                // Check Internet
                Container(
                  height: size.height*0.07,
                  width: size.width*0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customCheckbox(
                        text: "mini-fridge",
                      ),

                      // Check Furniture
                      customCheckbox(
                        text: "A/C",
                      ),

                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                // Check Microwave

                // Check A/C
                Container(
                  height: size.height*0.07,
                  width: size.width*0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customCheckbox(
                        text: "TV",
                      ),

                      // Check Dishwasher
                      customCheckbox(
                        text: "Leather Seats",
                      ),


                    ],
                  ),
                ),

                SizedBox(
                  height: size.height * 0.05,
                ),
                // Continue Button
                ElevatedButton(
                    child: Text("Continue", style: GoogleFonts.roboto(
                        textStyle: buttonText
                    ),
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
                      MaterialPageRoute(builder: (context) => const AddCars()),
                    );
                    }
                ),


              ]
          )
      ),
    );
  }
}




//Checkbox Buttons
class customCheckbox extends StatefulWidget {

  final String text;
  customCheckbox({required this.text});
  @override
  State<customCheckbox> createState() => _customCheckboxState();
}

class _customCheckboxState extends State<customCheckbox> {


  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        setState(() {
          _isSelected = ! _isSelected;
        });
      },

      // Button Design
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: _isSelected ? Colors.grey: Color(0xFF00ff00)),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: Colors.white,
          // borderRadius: BorderRadius.circular(25),



        ),

        //Text Design in button
        child:Align(
          child: Text(
            widget.text.isNotEmpty ? widget.text : "text" ,
            style: TextStyle(
              color: _isSelected ? Colors.grey : Color(0xFF00ff00),
              fontSize: 20,
            ),

          ),
        ),
        width: 160,
        height: 42,
      ),
    );
  }
}

