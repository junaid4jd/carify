
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class UpdateWorkStatusBuyer extends StatefulWidget {
  const UpdateWorkStatusBuyer({Key? key}) : super(key: key);

  @override
  _UpdateWorkStatusBuyerState createState() => _UpdateWorkStatusBuyerState();
}
// Options for radio buttons
enum Sublet { Yes, No }
enum Property { House, Apartment, Basement }

class _UpdateWorkStatusBuyerState extends State<UpdateWorkStatusBuyer> {
  final Sublet? _sublet = Sublet.No;
  Property? type = Property.House;


  int selectedValue = 0;

  // Text Style
  final wordButtons = const TextStyle(
      fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF424242));
  final smallText = const TextStyle(
      fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF424242));
  final radioButtonText = const TextStyle(
      fontSize: 15, color: Color(0xFF424242), fontWeight: FontWeight.bold);
  final titles = const TextStyle(
      fontSize: 37, fontWeight: FontWeight.bold, color: Colors.black);
  final buttonText = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white);

  // Range for options
  double distance = 35;
  double numberOfBedrooms = 3;
  double priceRangeMin = 300;
  double priceRangeMax = 800;
  double durationOfLease = 6;
  RangeValues priceRange = const RangeValues(600, 1500);

  @override
  Widget build(BuildContext context) {
    Size size =
        MediaQuery
            .of(context)
            .size; //provides total height and width of scr
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
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: Align(
                    alignment: const Alignment(0.0, -0.6),
                    child: Text(
                      'My work status is',
                      style: GoogleFonts.roboto(
                        textStyle: titles,
                        fontSize: 44,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),


              // Radio Items and decoration
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.only(),
                  child: Align(
                      alignment: const Alignment(0.0, 0.12),
                      child: Container(
                          height: 303,
                          width: 297,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFFC4C4C4),
                              ),
                              borderRadius:
                              const BorderRadius.all(Radius.circular(14))),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                            children: const [
                              RadioItem(itemName: 'Student'),
                              Divider(
                                height: 2,
                                thickness: 1,
                                color: Color(0xFFC4C4C4),
                              ),

                              RadioItem(itemName: 'Part-time'),
                              Divider(
                                height: 2,
                                thickness: 1,
                                color: Color(0xFFC4C4C4),
                              ),

                              RadioItem(itemName: 'Full-time'),
                              Divider(
                                height: 2,
                                thickness: 1,
                                color: Color(0xFFC4C4C4),
                              ),

                              RadioItem(itemName: 'Unemployed'),
                              Divider(
                                height: 2,
                                thickness: 1,
                                color: Color(0xFFC4C4C4),
                              ),

                              RadioItem(itemName: 'Other'),
                              Divider(
                                height: 2,
                                thickness: 1,
                                color: Color(0xFFC4C4C4),
                              ),

                              RadioItem(itemName: 'Prefer not to say'),
                            ],
                          )
                      )
                  ),
                ),
              ),


              // Continue button
              Positioned(
                  top: 660,
                  child: ElevatedButton(
                      child: Text("Update my work status", style: GoogleFonts.roboto(
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
                        MaterialPageRoute(builder: (context) => const UpdateWorkStatusBuyer()),
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


//Radio Button Design
class RadioItem extends StatelessWidget {

  const RadioItem({Key? key, required this.itemName}) : super(key: key);
  final String itemName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left:15),
          child: Text(
            itemName,
            style: const TextStyle(fontSize: 16.0,color: Color(0xFF757575)),
          ),
        ),
        Radio(
          fillColor: MaterialStateColor.resolveWith((states) => const Color(0xFFfb7c14)),
          value: 0,
          groupValue: 0,
          onChanged: (val) {},
        )

      ],
    );
  }
}



