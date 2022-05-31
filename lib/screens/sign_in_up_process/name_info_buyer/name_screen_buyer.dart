import 'package:carify_app/controller/buyer_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../account_type/Account_screen.dart';
import '../date_of_birth_buyer/birthday_screen_buyer.dart';


class NameScreenBuyer extends StatefulWidget {
  const NameScreenBuyer({Key? key}) : super(key: key);

  @override
  State<NameScreenBuyer> createState() => _NameScreenBuyerState();
}

class _NameScreenBuyerState extends State<NameScreenBuyer> {
  @override
  // Text Styles
  final wordButtons = const TextStyle(fontSize: 20, color: Color(0xFFfb7c14));
  final ParStyle = const TextStyle(fontSize: 13, color: Colors.black);
  final titles = const TextStyle(
      fontSize: 37, fontWeight: FontWeight.bold, color: Colors.black);
  final buttonText = const TextStyle(
      fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white);
  final nameController = TextEditingController();
  Widget build(BuildContext context) {
    final buyerData = Provider.of<BuyerProvider>(context);
    Size size = MediaQuery
        .of(context)
        .size;

    //provides total height and width of screen for users


    String name = '';

    final nameField = TextFormField(
        autofocus: false,
        controller: nameController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return "Please enter your name";
          }
          if (!RegExp("^[a-zA-Z]").hasMatch(value)) {
            return "Please enter a valid name";
          }
          return null;
        },
    //     onChanged: (val){
    //       nameController.text = val;
    // },
    );


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
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          AccountType())
                  );
                },
              ),
            ),


            // Screen title
            Positioned(
              child: Align(
                alignment: const Alignment(0.10, -0.6),
                child: Text('My full name is',
                    style: GoogleFonts.roboto(
                        textStyle: titles,
                        fontSize: 44
                    )
                ),
              ),
            ),


            // Text
            Positioned(
              child: Align(
                alignment: const Alignment(-0.33, -0.20),
                child: Text('Your name will be shown',
                    style: GoogleFonts.roboto(
                        textStyle: ParStyle,
                        fontSize: 16,
                        color: const Color(0xFF757575)
                    )
                ),
              ),
            ),


            // Text Field
            Positioned(
                child: Align(
                    alignment: Alignment(0, -0.30),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(70, 0, 70, 0),
                      child: TextField(
                          controller: nameController,
                          style: TextStyle(fontSize: 18),
                          keyboardType: TextInputType.text,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]+")),
                          ], // Only numbers can be entered
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(bottom: 4),
                              isDense: true,
                              hintText: "Full name"
                          )
                      ),
                    )
                )
            ),


            // Continue Button
            Positioned(
                top: 660,
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
                    onPressed: () async {
                      if(nameController.text.isNotEmpty){
                        buyerData.changeName = nameController.text;
                        print('This is name ${nameController.text}');
                        Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => const BirthdayBuyer()),
                        );
                      }
                      else{
                        Fluttertoast.showToast(msg: 'Name cannot be empty');
                      }


                      //await tenant.add({'Name':name}).then((value) => print('User added'));
                    }
                )
            ),


          ],
        ),
      ),
    );
  }
}
