import 'package:carify_app/controller/authentication_controller.dart';
import 'package:carify_app/services/authentication_service.dart';
import 'package:carify_app/utilites/general_utilites.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/style.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:provider/provider.dart';

import '../account_type/Account_screen.dart';
import '../car_description/car_desc.dart';
import '../name_info_buyer/name_screen_buyer.dart';
import '../signup_number/signup_number_screen.dart';

class OTPCode extends StatefulWidget {
  final String phone;
  String userType;

  OTPCode({required this.phone,required this.userType});

  @override
  _OTPCode createState() => _OTPCode();
}

class _OTPCode extends State<OTPCode> {
  static OtpFieldController OTPController = OtpFieldController();
  AuthService auth = AuthService();

  OTPCode get phone => phone;

  // Text Styles
  final ParStyle = const TextStyle(fontSize: 13, color: Colors.black);
  final titles = const TextStyle(fontSize: 37, fontWeight: FontWeight.bold, color: Colors.black);
  final buttonText = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    var authVm = Provider.of<AuthProvider>(context, listen: false);
    print('This mobile number will recive OTP code ${widget.phone}');

    Size size = MediaQuery.of(context).size; //provides total height and width of screen for users
    return SizedBox(
        height: size.height,
        width: double.infinity,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              // Screen Title Text
              Positioned(
                child: Align(
                  alignment: const Alignment(0, -0.79),
                  child: Text('My Code is', style: GoogleFonts.roboto(textStyle: titles, fontSize: 30)),
                ),
              ),

              // Verification Code Input
              Positioned(
                  child: Align(
                alignment: const Alignment(0, -0.60),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                  child: OTPTextField(
                    length: 6,
                    width: MediaQuery.of(context).size.width,
                    controller: OTPController,
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldWidth: 40,
                    fieldStyle: FieldStyle.underline,
                    outlineBorderRadius: 15,
                    onCompleted: (pin) async {
                      print('This is verfication code to verify ${authVm.verificationId}');
                      print('This is pin ${pin}');
                      try {
                        EasyLoading.show();
                        await FirebaseAuth.instance
                            .signInWithCredential(
                                PhoneAuthProvider.credential(verificationId: authVm.verificationId, smsCode: pin))
                            .then((value) {
                          if (value.user != null) {
                            debugPrint('User is logged in ${value.user!.uid}');
                            EasyLoading.dismiss();
                            if(widget.userType == 'Seller'){
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SellerName()),
                              );
                            }
                            else if(widget.userType =='Buyer'){
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NameScreenBuyer()),
                              );
                            }
                           ;
                          } else {
                            EasyLoading.dismiss();
                            Fluttertoast.showToast(msg: 'Something went wrong please try again');
                            print('user is null');
                          }
                        });
                      } catch (e) {
                        FocusScope.of(context).unfocus();
                        EasyLoading.dismiss();
                        print('Exception is $e');
                        Fluttertoast.showToast(msg: 'Invalid OTP please try again');
                        // GeneralUtilities().showMessage(context: context, title: 'Something went wrong', text: 'Invalid OTP');
                      }
                    },
                    style: const TextStyle(fontSize: 24),
                    onChanged: (pin) {
                      print("Changed: " + pin);
                    },
                  ),
                ),
              )),

              // Text
              Positioned(
                child: Align(
                  alignment: const Alignment(0, -0.30),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(58, 0, 58, 0),
                    child: Text(
                      'Please enter the 6-digit code sent to you at ${widget.phone}',
                      style: GoogleFonts.roboto(textStyle: ParStyle, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),

              // Back Arrow
              Positioned(
                top: 75,
                right: 345,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_rounded),
                  color: const Color(0xFF00ff00),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpNumberTenant(userType: widget.userType)));
                  },
                ),
              ),

              //Resend Code Button
              Positioned(
                child: Align(
                    alignment: const Alignment(0, -0.13),
                    child: TextButton(
                      style: TextButton.styleFrom(primary: const Color(0xFF00ff00)),
                      child: const Text('Resend'),
                      onPressed: () async {
                        await auth.verifyPhoneNumber(widget.phone, context);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => AccountType(
                        //             phone: widget.phone,
                        //             userId: null,
                        //           )),
                        // );
                      },
                    )),
              ),
            ],
          ),
        ));
  }

// Future verifyPhoneNumber() async {
//   await auth.verifyPhoneNumber(widget.phone).then((value) {
//     print('This is return value $value');
//   });
// }

}

// _verifyPhone()async {
//   FirebaseAuth auth = FirebaseAuth.instance;
//
//   await FirebaseAuth.instance.verifyPhoneNumber(
//
//     phoneNumber: widget.phone, timeout: Duration(seconds: 60),
//     verificationCompleted: (PhoneAuthCredential credential) async {
//       await auth.signInWithCredential(credential);
//     },
//
//
//     verificationFailed: (FirebaseAuthException e) {
//       if (e.code == 'invalid-phone_number') {
//         print('The provided phone number is not valid');
//       }
//     },
//     codeSent: (String verificationId, int? resendToken) async {
//
//       setState(() {
//         _verificationCode = verificationId;
//       });
//
//     },
//     codeAutoRetrievalTimeout: (String verificationId) {
//       print('gerb alert');
//     },
//   );
//
//   final User? user = auth.currentUser;
//   final uid = user?.uid;
//
//   print(uid);
//
// }

// @override
// void initState() {
//   // TODO: implement initState
//   super.initState();
//   _verifyPhone();
// }
// }
