import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier {


  String _uid = '';
  String verificationId = '';
  String _name = '';
  String _address = '';
  String _designation = '';

  String get uid => _uid;
  String get name => _name;
  String get address => _address;
  String get designation => _designation;


   setVerificationCode(String verificationCode){
    verificationId = verificationCode;
    notifyListeners();
  }

  set changeuid(String uid){
    _uid = uid;
    notifyListeners();
  }

  set changeName(String name) {
    _name = name;

    notifyListeners();
  }

  set changeAddress(String address) {
    _address = address;
    notifyListeners();
  }

  set changeDesignation(String designation) {
    _designation = designation;
    notifyListeners();
  }


  }
