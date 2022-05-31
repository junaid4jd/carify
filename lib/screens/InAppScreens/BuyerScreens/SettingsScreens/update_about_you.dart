import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';





class UpdateAboutBuyer extends StatefulWidget {
  const UpdateAboutBuyer({Key? key}) : super(key: key);

  @override
  _UpdateAboutBuyerState createState() => _UpdateAboutBuyerState();
}
// Options for radio buttons
enum Sublet { Yes, No }
enum Property { House, Apartment, Basement }

class _UpdateAboutBuyerState extends State<UpdateAboutBuyer> {
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
    return Scaffold(
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
              color: const Color(0xFFfb7c14),
              onPressed: () {Navigator.of(context).pop();
              },
            ),
          ),

          // Screen title
          Positioned(
            top: 130,
            child: Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Align(
                alignment: const Alignment(0.0, -0.6),
                child: Text(
                  'About you',
                  style: GoogleFonts.roboto(
                    textStyle: titles,
                    fontSize: 44,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),



          // Pet or no
          Positioned(
              top: 210,
              child: Container(
                  height: 85.67,
                  width: 370,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFF424242),
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(15))),
                  child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, right: 10),
                              child: SizedBox(
                                height: 20,
                                child: Row(
                                  children: [Text(
                                    "Do you have a pet?",
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                        color: const Color(0xFF424242)
                                    ),
                                  ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(right: 45),

                                child: SizedBox(
                                  child: Row(
                                      children: const [
                                        RadioItem(itemName: 'Yes'),
                                        Divider(
                                          height: 2,
                                          thickness: 1,
                                          color: Color(0xFFC4C4C4),
                                        ),
                                        Spacer(),

                                        RadioItem(itemName: 'No'),
                                        Divider(
                                          height: 2,
                                          thickness: 1,
                                          color: Color(0xFFC4C4C4),
                                        )



                                      ]
                                  ),
                                )
                            )
                          ]
                      )
                  )
              )
          ),

          // Cleaning
          Positioned(
              top: 310,
              child: Container(
                  height: 85.67,
                  width: 370,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFF424242),
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(15))),
                  child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, right: 10),
                              child: SizedBox(
                                height: 20,
                                child: Row(
                                  children: [Text(
                                    "I like to clean ___ times a week",
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                        color: const Color(0xFF424242)
                                    ),
                                  ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(right: 45),

                                child: SizedBox(
                                  child: Row(
                                      children: const [
                                        // Spacer(),
                                        // Spacer(),
                                        // Spacer(),
                                        // Spacer(),
                                        RadioItem(itemName: '1-2'),

                                        Divider(
                                          height: 2,
                                          thickness: 1,
                                          color: Color(0xFFC4C4C4),
                                        ),
                                        Spacer(),


                                        RadioItem(itemName: '3-4'),
                                        Divider(
                                          height: 2,
                                          thickness: 1,
                                          color: Color(0xFFC4C4C4),
                                        ),
                                        Spacer(),
                                        Spacer(),

                                        RadioItem(itemName: '5-7'),
                                        Divider(
                                          height: 2,
                                          thickness: 0,
                                          color: Color(0xFFC4C4C4),
                                        ),
                                        Spacer()
                                      ]
                                  ),
                                )
                            )
                          ]
                      )
                  )
              )
          ),

          // Cleaning
          Positioned(
              top: 410,
              child: Container(
                  height: 85.67,
                  width: 370,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFF424242),
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(15))),
                  child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, right: 10),
                              child: SizedBox(
                                height: 20,
                                child: Row(
                                  children: [Text(
                                    "I am a ___ smoker",
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                        color: const Color(0xFF424242)
                                    ),
                                  ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(right: 45),

                                child: SizedBox(
                                  child: Row(
                                      children: const [

                                        RadioItem(itemName: 'Non'),
                                        RadioItem(itemName: 'Occasional'),
                                        RadioItem(itemName: 'Regular'),

                                      ]
                                  ),
                                )
                            )
                          ]
                      )
                  )
              )
          ),

          // party
          Positioned(
              top: 510,
              child: Container(
                  height: 85.67,
                  width: 370,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFF424242),
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(15))),
                  child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, right: 10),
                              child: SizedBox(
                                height: 20,
                                child: Row(
                                  children: [Text(
                                    "I am a ___ partier",
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                        color: const Color(0xFF424242)
                                    ),
                                  ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(right: 45),

                                child: SizedBox(
                                  child: Row(
                                      children: const [

                                        RadioItem(itemName: 'Non'),

                                        Divider(
                                          height: 2,
                                          thickness: 1,
                                          color: Color(0xFFC4C4C4),
                                        ),


                                        RadioItem(itemName: 'Occasional'),
                                        Divider(
                                          height: 2,
                                          thickness: 1,
                                          color: Color(0xFFC4C4C4),
                                        ),


                                        RadioItem(itemName: 'Regular'),
                                        Divider(
                                          height: 1,
                                          thickness: 0,
                                          color: Color(0xFFC4C4C4),
                                        ),


                                      ]
                                  ),
                                )
                            )
                          ]
                      )
                  )
              )
          ),

          // Organized
          Positioned(
              top: 610,
              child: Container(
                  height: 85.67,
                  width: 370,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFF424242),
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(15))),
                  child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, right: 10),
                              child: SizedBox(
                                height: 20,
                                child: Row(
                                  children: [Text(
                                    "I am a ___ organized",
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                        color: const Color(0xFF424242)
                                    ),
                                  ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(right: 45),

                                child: SizedBox(
                                  child: Row(
                                      children: const [

                                        RadioItem(itemName: 'Not'),


                                        RadioItem(itemName: 'Somewhat'),


                                        RadioItem(itemName: 'Very'),


                                      ]
                                  ),
                                )
                            )
                          ]
                      )
                  )
              )
          ),




          // Continue Button
          Positioned(
              top: 740,
              child: ElevatedButton(
                  child: Text("Update myself", style: GoogleFonts.roboto(
                      textStyle: buttonText
                  )
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xFFfb7c14),
                      minimumSize: const Size(320, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)
                      )
                  ),
                  onPressed: () { Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const UpdateAboutBuyer()),
                  );
                  }
              )
          ),

        ],
      ),
    );

    //);
  }
}


// Radio Button
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

