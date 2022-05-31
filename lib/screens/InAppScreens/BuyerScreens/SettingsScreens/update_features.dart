import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';




class UpdateFeaturesBuyer extends StatefulWidget {
  const UpdateFeaturesBuyer({Key? key}) : super(key: key);

  @override
  _UpdateFeaturesBuyerState createState() => _UpdateFeaturesBuyerState();
}


class _UpdateFeaturesBuyerState extends State<UpdateFeaturesBuyer> {


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

          child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  height: 800,
                ),



                //Back Button
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


                //Screen Title
                Positioned(
                  top: 145,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: Align(
                      alignment: const Alignment(0.0, -0.6),
                      child: Text(
                        'Preferred\n Features',
                        style: GoogleFonts.roboto(
                          textStyle: titles,
                          fontSize: 44,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),


                // Text
                Positioned(
                  top: 260,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: Align(
                      alignment: const Alignment(0.0, -0.6),
                      child: Text('Let us know what you are looking for\n in your car. Features can be added\n or removed later',
                        style: GoogleFonts.roboto(
                          textStyle: smallText,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),


                // Check Utilities
                Positioned(
                  top: 340,
                  left:30,
                  child: customCheckbox(
                    text: "Push to start",
                  ),
                ),


                // Check Parking
                Positioned(
                  top: 340,
                  right:30,
                  child: customCheckbox(
                    text: "Wifi",
                  ),
                ),


                // Check Internet
                Positioned(
                  top: 400,
                  left:30,
                  child: customCheckbox(
                    text: "Bluetooth",
                  ),
                ),


                // Check Laundry
                Positioned(
                  top: 400,
                  right:30,
                  child: customCheckbox(
                    text: "Touch Screen",
                  ),
                ),


                Positioned(
                  top: 460,
                  left:30,
                  child: customCheckbox(
                    text: "Mini-Fridge",
                  ),
                ),


                // Check Furniture
                Positioned(
                  top: 460,
                  right:30,
                  child: customCheckbox(
                    text: "a/c",
                  ),
                ),


                // Check A/C
                Positioned(
                  top: 520,
                  left:30,
                  child: customCheckbox(
                    text: "TV",
                  ),

                ),


                // Check Dishwasher
                Positioned(
                  top: 520,
                  right:30,
                  child: customCheckbox(
                    text: "Leather Seats",
                  ),
                ),



                // Continue Button
                Positioned(
                    top: 745,
                    child: ElevatedButton(
                        child: Text("Update my features", style: GoogleFonts.roboto(
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
                          MaterialPageRoute(builder: (context) => const UpdateFeaturesBuyer()),
                        );
                        }
                    )
                ),


              ]
          )
      ),
    );
  }
}

// Custom Checkbox
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
          border: Border.all(width: 2, color: _isSelected ? Colors.grey: Colors.orange),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: Colors.white,
          // borderRadius: BorderRadius.circular(25),


          // Text Design
        ),
        child:Align(
          child: Text(
            widget.text.isNotEmpty ?widget.text :"text",
            style: TextStyle(
              color: _isSelected ? Colors.grey : Colors.orange,
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

