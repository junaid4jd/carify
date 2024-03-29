import 'package:carify_app/controller/authentication_controller.dart';
import 'package:carify_app/screens/sign_in_up_process/gender_type_buyer/gender_screen_buyer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../controller/buyer_provider.dart';
import '../../buyer_school_info/buyer_school_info.dart';

class Background extends StatefulWidget {
  final Widget child;

  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  // Text Styles
  final wordButtons = const TextStyle(fontSize: 20, color: Color(0xFF00ff00));

  final parStyle = const TextStyle(fontSize: 13, color: Colors.black);

  final titles = const TextStyle(fontSize: 37, fontWeight: FontWeight.bold, color: Colors.black);

  final buttonText = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    var formVm = Provider.of<BuyerProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size; //provides total height and width of screen for users
    return SizedBox(
        height: size.height,
        width: double.infinity,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
           // alignment: Alignment.center,
            children: <Widget>[
              // Back Arrow


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
              SizedBox(
                height: size.height * 0.05,
              ),


              // Positioned(
              //   top: 105,
              //   right: 340,
              //   child: IconButton(
              //     icon: const Icon(Icons.arrow_back_ios_rounded),
              //     color: const Color(0xFF00ff00),
              //     onPressed: () {
              //       Navigator.push(context, MaterialPageRoute(builder: (context) => const GenderScreenBuyer()));
              //     },
              //   ),
              // ),

              // Screen title
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Align(
                  alignment: const Alignment(0.0, -0.6),
                  child: Text(
                    'My work status is',
                    style: GoogleFonts.roboto(
                      textStyle: titles,
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              SizedBox(
                height: size.height * 0.05,
              ),

              // Radio Items and decoration
              Padding(
                padding: const EdgeInsets.only(),
                child: Align(
                    alignment: const Alignment(0.0, 0.12),
                    child: Consumer<BuyerProvider>(
                      builder: (context, userProvider, _) {
                        return Container(
                            height: size.height*0.5,
                            width: size.width*0.85,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xFFC4C4C4),
                                ),
                                borderRadius: const BorderRadius.all(Radius.circular(14))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                RadioButton('Student',1,handleRadioValueChange,userProvider.usertypeBtnValue),

                                RadioButton('Part-time',2,handleRadioValueChange,userProvider.usertypeBtnValue),

                                RadioButton('Full-time',3,handleRadioValueChange,userProvider.usertypeBtnValue),

                                RadioButton('Unemployed',4,handleRadioValueChange,userProvider.usertypeBtnValue),

                                RadioButton('Other',5,handleRadioValueChange,userProvider.usertypeBtnValue),

                                RadioButton('Prefer not to say',6,handleRadioValueChange,userProvider.usertypeBtnValue),

                              ],
                            ));
                      },
                    )),
              ),

              Expanded(child: Container()),

              // Continue button
              ElevatedButton(
                  child: Text("Continue", style: GoogleFonts.roboto(textStyle: buttonText)),
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF00ff00),
                      minimumSize: const Size(320, 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
                  onPressed: () {

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BuyerSchoolInfo()),
                    );
                  }),
              SizedBox(
                height: size.height * 0.05,
              ),
            ],
          ),
        ));
  }

  void handleRadioValueChange(int? value) {
    final formsVm = Provider.of<BuyerProvider>(context, listen: false);
    formsVm.usertypeBtnValue = value!;

    switch (formsVm.usertypeBtnValue) {
      case 1:
        formsVm.usertypeBtnValue = 1;
        formsVm.userType = 'Student';
        print('at button press type is ${formsVm.userType}');
        break;
      case 2:
        formsVm.usertypeBtnValue = 2;
        formsVm.userType = 'Part-time';
        print('at button press type is ${formsVm.userType}');
        break;
      case 3:
        formsVm.usertypeBtnValue = 3;
        formsVm.userType = 'Full-time';
        break;
      case 4:
        formsVm.usertypeBtnValue = 4;
        formsVm.userType = 'Unemployed';
        print('at button press type is ${formsVm.userType}');
        break;
      case 5:
        formsVm.usertypeBtnValue = 5;
        formsVm.userType = 'Other';
        print('at button press type is ${formsVm.userType}');
        break;
      case 6:
        formsVm.usertypeBtnValue = 6;
        formsVm.userType = 'Prefer not to say';
        break;
    }
  }

  Widget RadioButton(String title,int value,var onChange,int grpValue){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                title,
                style: const TextStyle(fontSize: 16.0, color: Color(0xFF00ff00)),
              ),
            ),
            Radio(
              fillColor: MaterialStateColor.resolveWith((states) => const Color(0xFF00ff00)),
              value: value,
              groupValue: grpValue,
              onChanged: onChange
            ),

          ],
        ),
       value == 6 ? SizedBox(): Divider(
          height: 2,
          thickness: 1,
          color: Color(0xFF00ff00),
        ),
      ],

    );

  }
}


