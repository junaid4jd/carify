// ignore_for_file: unused_local_variable

import 'package:carify_app/screens/sign_in_up_process/verify_number_code/OTP_screen.dart';
import 'package:carify_app/services/authentication_service.dart';
import 'package:carify_app/utilites/general_utilites.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:intl_phone_number_input/intl_phone_number_input.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class SignUpNumberTenant extends StatefulWidget {
  SignUpNumberTenant({
    Key? key,
    required this.userType
  }) : super(key: key);
String userType;
  @override
  _SignUpNumberTenant createState() => _SignUpNumberTenant();
}

class _SignUpNumberTenant extends State<SignUpNumberTenant> {
  final TextEditingController numberController = TextEditingController();
  static String phoneNum = '';

  AuthService auth = AuthService();

  //
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //String verificationIDReceived = '';

  // Text Style
  final ParStyle = const TextStyle(fontSize: 13, color: Colors.black);
  final titles = const TextStyle(fontSize: 37, fontWeight: FontWeight.bold, color: Colors.black);
  final buttonText = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //provides total height and width of scr
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // Back Arrow
          Positioned(
            top: 75,
            right: 345,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_rounded),
              color: const Color(0xFF00ff00),
              onPressed: () {
                Navigator.pop(
                  context,
                );
              },
            ),
          ),

          //Screen Title Text
          Positioned(
            child: Align(
              alignment: const Alignment(0, -0.79),
              child: Text('My Number is',
                  style: GoogleFonts.roboto(
                    textStyle: titles,
                  )),
            ),
          ),

          //Text
          Positioned(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(50.0, 0, 50.0, 0),
              child: Align(
                  alignment: const Alignment(0, -0.30),
                  child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Text(
                        'When you tap “Continue”, Carify will send a text with verification code. '
                        'Message and data rates may apply. '
                        'The verified phone number can be used to log in. '
                        'Learn what happens when your number changes.',
                        style: GoogleFonts.roboto(
                          textStyle: ParStyle,
                        ),
                        textScaleFactor: 1.2,
                        textAlign: TextAlign.justify,
                      ))),
            ),
          ),

          // Phone Number Input
          Positioned(
              child: Form(
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                      child: Align(
                        alignment: const Alignment(0, -0.55),
                        child: InternationalPhoneNumberInput(
                          onInputChanged: (PhoneNumber number) {
                            if (kDebugMode) {
                              phoneNum = number.phoneNumber.toString();
                              print(phoneNum);
                            }
                          },
                          textFieldController: numberController,
                          ignoreBlank: false,
                          autoValidateMode: AutovalidateMode.disabled,
                          selectorTextStyle: const TextStyle(color: Colors.black),
                          initialValue: PhoneNumber(isoCode: 'PK'),
                          formatInput: false,
                          maxLength: 10,
                          keyboardType: TextInputType.phone,
                          inputDecoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(left: 0.0),
                            hintText: '+1 354 112 2376',
                            isDense: true,

                            ///added
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter phone number';
                            }
                            return null;
                          },
                          spaceBetweenSelectorAndTextField: 0,
                        ),
                      )))),

          //Continue Button
          Positioned(
              top: 440,
              child: ElevatedButton(
                  child: Text("Continue", style: GoogleFonts.roboto(textStyle: buttonText)),
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF00ff00),
                      minimumSize: const Size(320, 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
                  onPressed: () async {
                    print('This is mobile number: ${phoneNum}');
                    if(phoneNum.isNotEmpty){
                      if (await GeneralUtilities.checkInternetConnection() != null) {
                        EasyLoading.show();
                        await auth.verifyPhoneNumber(phoneNum, context).then((value) async {
                          EasyLoading.dismiss();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => OTPCode(phone: phoneNum,userType: widget.userType,)),
                          );
                        });
                      } else {
                        Fluttertoast.showToast(msg: 'Please check internet');
                    }
                    }else{
                      Fluttertoast.showToast(msg: 'Phone Number can not be Empty');
                    }

                    // whenComplete(() {
                    //   // Navigator.push(context, MaterialPageRoute(builder: (context) => OTPCode(phone: phoneNum)),);
                    // });
                    // FirebaseAuth auth = FirebaseAuth.instance;
                    //
                    // await FirebaseAuth.instance.verifyPhoneNumber(
                    //   phoneNumber: phoneNum,
                    //   verificationCompleted: (PhoneAuthCredential credential) async {
                    //     await auth.signInWithCredential(credential);
                    //
                    //
                    //   },
                    //
                    //   verificationFailed: (FirebaseAuthException e) {
                    //     if (e.code == 'invalid-phone_number') {
                    //       print('The provided phone number is not valid');
                    //     }
                    //   },
                    //   codeSent: (String verificationId, int? resendToken) async{
                    //     String smsCode = '3343';
                    //
                    //     PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
                    //     await auth.signInWithCredential(credential);
                    //
                    //   },
                    //   codeAutoRetrievalTimeout: (String verificationId) {
                    //     print('gerb alert');
                    //   },
                    // );

                    // await auth.verifyPhoneNumber(
                    //   phoneNumber: '+44 7123 123 456',
                    //   verificationCompleted: (PhoneAuthCredential credential) async {
                    //     // ANDROID ONLY!
                    //
                    //     // Sign the user in (or link) with the auto-generated credential
                    //     await auth.signInWithCredential(credential);
                    //   }, verificationFailed: (FirebaseAuthException error) {  },
                    //   codeAutoRetrievalTimeout: (String verificationId) {  },
                    //
                    //   codeSent: (String verificationId, int? forceResendingToken )
                    //   async{String smsCode = '9893';},
                    // );
                  }))
        ],
      ),
    );
  }
}
