

import 'package:carify_app/controller/authentication_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _verificationId = "" ;

  Future<String> verifyPhoneNumber(String phoneNumber,BuildContext context)async {
    print('This is phone number ${phoneNumber}');
    try{
      await _auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credentials) async {
            print(''
                ' ${credentials}');
            await FirebaseAuth.instance.signInWithCredential(credentials).then((value) {
              if(value.user != null){
                debugPrint('User is logged in ${value.user}');
              }
              else{
                print('user is null');
              }
            });
          },
          verificationFailed: (FirebaseException e ){
            debugPrint('This is exception ${e.message}');
          },
          codeSent: (String verificationCode , int? resendToken){
            _verificationId = verificationCode;
            Provider.of<AuthProvider>(context,listen: false).setVerificationCode(verificationCode);
            print('This is verification code ${_verificationId}');
          },
          codeAutoRetrievalTimeout: (String verificationCode){
            _verificationId = verificationCode;
          },timeout: Duration(seconds: 60));


    }
    catch(e){
      print('This is exception $e');
      Fluttertoast.showToast(msg: 'Something went wrong');
    }
    print('This is verification code i will return ${_verificationId}');
    return _verificationId;
  }


}