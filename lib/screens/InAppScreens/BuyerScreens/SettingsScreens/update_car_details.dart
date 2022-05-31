
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class UpdateCarDetailsBuyer extends StatefulWidget {
  const UpdateCarDetailsBuyer({Key? key}) : super(key: key);

  @override
  _UpdateCarDetailsBuyerState createState() => _UpdateCarDetailsBuyerState();
}
// Options for radio buttons
enum Sublet { Yes, No }
enum Property { House, Apartment, Basement }

class _UpdateCarDetailsBuyerState extends State<UpdateCarDetailsBuyer> {
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
                  'House Details',
                  style: GoogleFonts.roboto(
                    textStyle: titles,
                    fontSize: 44,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),

          // Distance from address
          Positioned(
              top:220,
              child: Container(
                height: 96.67,
                width: 350,
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
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: SizedBox(
                          height: 20,
                          child: Row(
                            children: [Text(
                              "Distance from Address",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: const Color(0xFF424242)
                              ),
                            ), const Spacer(), Text(
                              "35 kilometers",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF757575),
                                  fontSize: 12
                              ),
                            )
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 25,
                        child: SliderTheme(
                          data: SliderThemeData(
                            overlayShape: SliderComponentShape.noThumb,
                          ),
                          child: Slider(
                            value: distance,
                            divisions: 100,
                            min: 1,
                            max: 100,
                            activeColor: const Color(0xFF00ff00),
                            onChanged: (value) =>
                                setState(() => distance = value),
                          ),),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          children: [Text(
                            "1 kilometer",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF757575),
                                fontSize: 12
                            ),
                          ), const Spacer(),

                            Text(
                              "100 kilometers",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF757575),
                                  fontSize: 12
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
          ),

          // # of bedrooms
          Positioned(
              top: 333,
              child: Container(
                height: 96.67,
                width: 350,
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
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: SizedBox(
                          height: 20,
                          child: Row(
                            children: [Text(
                              "Number of Bedrooms",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: const Color(0xFF424242)
                              ),
                            ), const Spacer(), Text(
                              "3 bedrooms",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF757575),
                                  fontSize: 12
                              ),
                            )
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 25,
                        child: SliderTheme(
                          data: SliderThemeData(
                            overlayShape: SliderComponentShape.noThumb,
                          ),
                          child: Slider(
                            value: numberOfBedrooms,
                            divisions: 10,
                            min: 1,
                            max: 10,
                            activeColor: const Color(0xFF00ff00),
                            onChanged: (value) =>
                                setState(() => numberOfBedrooms = value),
                          ),),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          children: [Text(
                            "1 bedroom",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF757575),
                                fontSize: 12
                            ),
                          ), const Spacer(),
                            Text(
                              "9+ bedrooms",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF757575),
                                  fontSize: 12
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
          ),

          // price per bedroom
          Positioned(
              top: 445,
              child: Container(
                height: 96.67,
                width: 350,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFF424242),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15,left:10,right:10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                        child: Row(
                          children: [Text(
                            "Price Range per car",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: const Color(0xFF424242)
                            ),
                          ), const Spacer(), Text(
                            "\$6500-24000",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF757575),
                                fontSize: 12
                            ),
                          )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                        child: SliderTheme(
                          data: SliderThemeData(
                            overlayShape: SliderComponentShape.noThumb,
                          ),
                          child: RangeSlider(
                            values: priceRange,
                            divisions: 4001,
                            min: 0,
                            max: 4000,
                            activeColor: const Color(0xFF00ff00),
                            onChanged: (RangeValues values) {
                              setState(() {
                                priceRange = values;
                              });
                            },
                          ),),
                      ),
                      Row(
                        children: [Text(
                          "\$0",
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF757575),
                              fontSize: 12
                          ),
                        ), const Spacer(),
                          Text(
                            "\$4000",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF757575),
                                fontSize: 12
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
          ),

          // duration of lease
          Positioned(
              top: 560,
              child: Container(
                height: 96.67,
                width: 350,
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
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: SizedBox(
                          height: 20,
                          child: Row(
                            children: [Text(
                              "Duration of Lease",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: const Color(0xFF424242)
                              ),
                            ), const Spacer(), Text(
                              "3 months",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF757575),
                                  fontSize: 12
                              ),
                            )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                        child: SliderTheme(
                          data: SliderThemeData(
                            overlayShape: SliderComponentShape.noThumb,
                          ),
                          child: Slider(
                            value: durationOfLease,
                            divisions: 12,
                            min: 1,
                            max: 12,
                            activeColor: const Color(0xFF00ff00),
                            onChanged: (value) =>
                                setState(() => durationOfLease = value),
                          ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          children: [Text(
                            "1 month",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF757575),
                                fontSize: 12
                            ),
                          ), const Spacer(),
                            Text(
                              "12+ months",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF757575),
                                  fontSize: 12
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
          ),



          // Continue Button
          Positioned(
              top: 710,
              child: ElevatedButton(
                  child: Text("Update car details", style: GoogleFonts.roboto(
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
                    MaterialPageRoute(builder: (context) => const UpdateCarDetailsBuyer()),
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
