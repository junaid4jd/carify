import 'package:carify_app/controller/buyer_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../address_buyer/address_screen_buyer.dart';
import '../../buyer_school_info/buyer_school_info.dart';


class Background extends StatelessWidget {
  final Widget child;

   Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  final wordButtons = const TextStyle(fontSize: 20, color: Color(0xFF00ff00));
  final parStyle = const TextStyle(fontSize: 13, color: Colors.black);
  final titles = const TextStyle(fontSize: 37, fontWeight: FontWeight.bold, color: Colors.black);
  final buttonText = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white);
  TextEditingController programController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final buyerData = Provider.of<BuyerProvider>(context);
    Size size = MediaQuery.of(context)
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
                top: 35,
                right: 340,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_rounded),
                  color: const Color(0xFF00ff00),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const BuyerSchoolInfo())
                    );
                  },
                ),
              ),

              //Screen title
              Positioned(
                child: Align(
                  alignment: const Alignment(0.10, -0.6),
                  child: Text('My degree is',
                      style: GoogleFonts.roboto(
                          textStyle: titles,
                          fontSize: 44
                      )),
                ),
              ),

              //Text
              Positioned(
                child: Align(
                  alignment: const Alignment(-0.26, -0.20),
                  child: Text('Your degree will be shown',
                      style: GoogleFonts.roboto(
                          textStyle: parStyle,
                          fontSize: 16,
                          color: const Color(0xFF00ff00)
                      )),
                ),
              ),

              // Text Field
               Positioned(
                  child: Align(
                      alignment: Alignment(0, -0.30),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(70, 0, 70, 0),
                        child: TextField(
                            keyboardType: TextInputType.text,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
                            ],
                          controller: programController,
                            style: TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: 4),
                                isDense: true,
                                hintText: "Business"
                            )),
                      )
                  )
              ),

              // Continue button
              Positioned(
                  top: size.height * 0.9,
                  child: ElevatedButton(
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
                        if(programController.text.isNotEmpty){
                          buyerData.changeProgram = programController.text;
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const AddressScreenBuyer()),
                          );
                        }
                        else{
                          Fluttertoast.showToast(msg: 'Degree cannot be empty');
                        }

                      }
                  )
              ),


            ],
          ),
        )
    );
  }
}
