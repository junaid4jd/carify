import 'package:carify_app/controller/buyer_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../features_buyer/preferred_screen.dart';
import '../profile_pic_buyer/profile_pic.dart';




class AboutBuyer extends StatefulWidget {
  const AboutBuyer({Key? key}) : super(key: key);

  @override
  _AboutBuyerState createState() => _AboutBuyerState();
}
// Options for radio buttons
enum Sublet { Yes, No }
enum Property { House, Apartment, Basement }

class _AboutBuyerState extends State<AboutBuyer> {
  final Sublet? _sublet = Sublet.No;
  Property? type = Property.House;


  int petSelectedValue = 1;
  int cleaningSelectedValue = 3;
  int smokerSelectedValue = 6;
  int partierSelectedValue = 9;
  int organizedSelectedValue = 12;

  bool havePet = false;
  String cleaningTime = '0';
  String smoker = 'Non';
  String partier = 'Non';
  String organized = 'Not';


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
    var buyerVm = Provider.of<BuyerProvider>(context,listen: false);
    Size size =
        MediaQuery
            .of(context)
            .size; //provides total height and width of scr
    return Scaffold(
      backgroundColor: Colors.white,


      body: SingleChildScrollView(
        child: Column(
        //  alignment: Alignment.center,
          children: <Widget>[


            SizedBox(
              height: size.height * 0.05,
            ),

            Container(
              width: size.width ,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_rounded),
                    color: Color(0xFF00ff00),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FeaturesBuyer())
                      );
                     // Navigator.of(context).pop();
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
            Padding(
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

            SizedBox(
              height: size.height * 0.02,
            ),

            // Pet or no
            Padding(
              padding: const EdgeInsets.all(8.0),
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
                                      children:  [
                                        RadioItem(values: 1,itemName: 'Yes',group: petSelectedValue,onChange: (val){
                                          print('Hello this is val $val');
                                          setState(() {
                                            petSelectedValue = val;
                                            havePet = true;
                                          });
                                        }),
                                        Divider(
                                          height: 2,
                                          thickness: 1,
                                          color: Color(0xFFC4C4C4),
                                        ),
                                        Spacer(),

                                        RadioItem(values: 2,itemName: 'No',group: petSelectedValue,onChange: (val){
                                          print('Hello this is val $val');
                                          setState(() {
                                            petSelectedValue = val;
                                            havePet = false;
                                          });
                                        }),
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
              ),
            ),

            // Cleaning
            Padding(
              padding: const EdgeInsets.all(8.0),
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
                                      children:  [
                                        // Spacer(),
                                        // Spacer(),
                                        // Spacer(),
                                        // Spacer(),
                                        RadioItem(values: 3,itemName: '1-2',group: cleaningSelectedValue,onChange: (val){
                                          setState(() {
                                            cleaningSelectedValue = val;
                                            cleaningTime = '1-2';
                                          });
                                        }),

                                        Divider(
                                          height: 2,
                                          thickness: 1,
                                          color: Color(0xFFC4C4C4),
                                        ),
                                        Spacer(),


                                        RadioItem(values: 4,itemName: '3-4',group: cleaningSelectedValue,onChange: (val){
                                          setState(() {
                                            cleaningSelectedValue = val;
                                            cleaningTime = '3-4';
                                          });
                                        }),
                                        Divider(
                                          height: 2,
                                          thickness: 1,
                                          color: Color(0xFFC4C4C4),
                                        ),
                                        Spacer(),
                                        Spacer(),

                                        RadioItem(values: 5,itemName: '5-7',group: cleaningSelectedValue,onChange: (val){
                                          setState(() {
                                            cleaningSelectedValue = val;
                                            cleaningTime = '5-7';
                                          });
                                        }),
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
              ),
            ),
            //
            // // Cleaning
            Padding(
              padding: const EdgeInsets.all(8.0),
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
                                padding: const EdgeInsets.only(right: 0),

                                child: SizedBox(
                                  child: Row(
                                      children:  [

                                        RadioItem(values: 6 ,itemName: 'Non',group: smokerSelectedValue,onChange: (val){
                                          setState(() {
                                            smokerSelectedValue = val;
                                            smoker = 'Non';
                                          });
                                        }),
                                        RadioItem(values: 7 ,itemName: 'Occasional',group: smokerSelectedValue,onChange: (val){
                                          setState(() {

                                            smokerSelectedValue = val;
                                            smoker = 'Occasional';
                                          });
                                        }),
                                        RadioItem(values: 8 ,itemName: 'Regular',group: smokerSelectedValue,onChange: (val){
                                          setState(() {
                                            smokerSelectedValue = val;
                                            smoker = 'Regular';
                                          });
                                        }),

                                      ]
                                  ),
                                )
                            )
                          ]
                      )
                  )
              ),
            ),
            //
            // // party
            Padding(
              padding: const EdgeInsets.all(8.0),
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
                                padding: const EdgeInsets.only(right: 0),

                                child: SizedBox(
                                  child: Row(
                                      children:  [

                                        RadioItem(values: 9 ,itemName: 'Non',group: partierSelectedValue,onChange: (val){
                                          setState(() {
                                            partierSelectedValue = val;
                                            partier = 'Non';
                                          });
                                        }),

                                        Divider(
                                          height: 2,
                                          thickness: 1,
                                          color: Color(0xFFC4C4C4),
                                        ),


                                        RadioItem(values: 10 ,itemName: 'Occasional',group: partierSelectedValue,onChange: (val){
                                          setState(() {
                                            partierSelectedValue = val;
                                            partier = 'Occasional';
                                          });
                                        }),
                                        Divider(
                                          height: 2,
                                          thickness: 1,
                                          color: Color(0xFFC4C4C4),
                                        ),


                                        RadioItem(values: 11 ,itemName: 'Regular',group: partierSelectedValue,onChange: (val){
                                          setState(() {
                                            partierSelectedValue = val;
                                            partier = 'Regular';
                                          });
                                        }),
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
              ),
            ),
            //
            // // Organized
            Padding(
              padding: const EdgeInsets.all(8.0),
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
                                padding: const EdgeInsets.only(right: 35),

                                child: SizedBox(
                                  child: Row(
                                      children:  [

                                        RadioItem(values: 12 ,itemName: 'Not',group: organizedSelectedValue,onChange: (val){
                                          setState(() {
                                            organizedSelectedValue = val;
                                            organized = 'Not';
                                          });
                                        }),


                                        RadioItem(values: 13 ,itemName: 'Somewhat',group: organizedSelectedValue,onChange: (val){
                                          setState(() {
                                            organizedSelectedValue = val;
                                            organized = 'Somewhat';
                                          });
                                        }),


                                        RadioItem(values: 14 ,itemName: 'Very',group: organizedSelectedValue,onChange: (val){
                                          setState(() {
                                            organizedSelectedValue = val;
                                            organized = 'Very';
                                          });
                                        }),


                                      ]
                                  ),
                                )
                            )
                          ]
                      )
                  )
              ),
            ),
            //
            //
            //
            //
            // // Continue Button
            SizedBox(
              height: size.height * 0.025,
            ),
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
                onPressed: () {
                  // print('This is pet value $havePet');
                  // print('This is clean time $cleaningTime ');
                  // print('This is clean time $cleaningTime)
                  // print('This is smoker $smok);
                  print('These are values $havePet $cleaningTime $smoker $partier $organized');
                  buyerVm.setHavePet(havePet);
                  buyerVm.setCleaningTime(cleaningTime);
                  buyerVm.setSmoker(smoker);
                  buyerVm.setPartier(partier);
                  buyerVm.setOrganized(organized);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePicBuyer()),
                );
                }
            ),
            SizedBox(
              height: size.height * 0.02,
            ),

          ],
        ),
      ),
    );

    //);
  }

  Widget RadioItem({required int values,required String  itemName,required int group,required var onChange}){
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left:15),
          child: Text(
            itemName,
            style: const TextStyle(fontSize: 14.0,color: Color(0xFF757575)),
          ),
        ),
        Radio(
          fillColor: MaterialStateColor.resolveWith((states) => const Color(0xFF00ff00)),
          value: values,
          groupValue: group,
          onChanged: onChange
        )
      ],
    );
  }
}


// Radio Button
// class RadioItem extends StatelessWidget {
//
//    RadioItem({Key? key, required this.itemName,required this.group}) : super(key: key);
//   final String itemName;
//   final int group;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.only(left:15),
//           child: Text(
//             itemName,
//             style: const TextStyle(fontSize: 16.0,color: Color(0xFF757575)),
//           ),
//         ),
//         Radio(
//           fillColor: MaterialStateColor.resolveWith((states) => const Color(0xFF00ff00)),
//           value: 0,
//           groupValue: group,
//           onChanged: (val) {
//             print('This is value ${val}');print('This is Group ${group}');
//           },
//         )
//
//       ],
//     );
//   }
// }

