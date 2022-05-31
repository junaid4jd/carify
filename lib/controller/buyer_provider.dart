import 'dart:io';

import 'package:carify_app/models/buyer_model.dart';
import 'package:carify_app/services/firestore_service.dart';
import 'package:flutter/cupertino.dart';

class BuyerProvider extends ChangeNotifier {
  MyFireStoreService fireStoreService = MyFireStoreService();

  String _userid = "";
  String _fullName = "";
  String _birthday = "";
  String _userMobile = "";
  String _gender = "";
  String _address = "";
  String _addressRadius = "";
  String _school = "";
  String _program = "";
  String _year = "";
  String _favCar = "";
  String _distanceDriven = "";
  String _noOfDoors = "";
  String _priceRangeStart = "";
  String _priceRangeEnd = "";
  String _paymentDuration = "";
  int _workStatus = 1;
  String _userType = "";
  bool pushToStart = false;
  bool wifi = false;
  bool bluetooth = false;
  bool touchScreen = false;
  bool miniFridge = false;
  bool ac = false;
  bool tv = false;
  bool leatherSeat = false;
  bool _havePet = false;
  String _cleaningTime = '0';
  String _smoker = 'Non';
  String _partier = 'Non';
  String _organized = 'Not';
  String? imageDownloadUrl;

  String get userType => _userType;

  setHavePet(bool value) {
    pushToStart = value;
    notifyListeners();
  }

  setCleaningTime(String value) {
    _cleaningTime = value;
    notifyListeners();
  }

  setSmoker(String value) {
    _smoker = value;
    notifyListeners();
  }

  setPartier(String value) {
    _partier = value;
    notifyListeners();
  }

  setOrganized(String value) {
    _organized = value;
    notifyListeners();
  }

  setPushToStartValue(bool value) {
    print('i am gonna set pushtostart ${value}');
    pushToStart = value;
    print('This is pushtostart ${value}');
    notifyListeners();
  }

  setWifiValue(bool value) {
    print('i am gonna set pushtostart ${value}');
    wifi = value;
    notifyListeners();
  }

  setBluetoothValue(bool value) {
    bluetooth = value;
    notifyListeners();
  }

  setTouchScreenValue(bool value) {
    touchScreen = value;
    notifyListeners();
  }

  setMiniFridgeValue(bool value) {
    miniFridge = value;
    notifyListeners();
  }

  setAcValue(bool value) {
    ac = value;
    notifyListeners();
  }

  setTvValue(bool value) {
    tv = value;
    notifyListeners();
  }

  setLeatherSeatValue(bool value) {
    leatherSeat = value;
    notifyListeners();
  }

  set userType(String value) {
    _userType = value;
    notifyListeners();
  }

  int get usertypeBtnValue => _workStatus;

  set usertypeBtnValue(int value) {
    _workStatus = value;
    notifyListeners();
  }

  set carDistanceDriven(String distanceDriven) {
    _distanceDriven = distanceDriven;
    notifyListeners();
  }

  set carNoOfDoors(String noOfDoors) {
    _noOfDoors = noOfDoors;
    notifyListeners();
  }

  set carPriceRangeStart(String priceRange) {
    _priceRangeStart = priceRange;
    notifyListeners();
  }

  set carPriceRangeEnd(String priceRangeEnd) {
    _priceRangeEnd = priceRangeEnd;
    notifyListeners();
  }

  set carPaymentDuration(String paymentDuration) {
    _paymentDuration = paymentDuration;
    notifyListeners();
  }

  set changeUid(String uid) {
    _userid = uid;
    notifyListeners();
  }

  set changeName(String name) {
    print('I am gonna set this $name');
    _fullName = name;
    notifyListeners();
  }

  set changeBirthday(String birthday) {
    _birthday = birthday;
    notifyListeners();
  }

  set changeMobile(String mobile) {
    _userMobile = mobile;
    notifyListeners();
  }

  set changeGender(String gender) {
    _gender = gender;
    notifyListeners();
  }

  set changeAddress(String address) {
    _address = address;
    notifyListeners();
  }

  set changeProgram(String program) {
    _program = program;
    notifyListeners();
  }

  set changeYearr(String year) {
    _year = year;
    notifyListeners();
  }

  set changefavCar(String favCar) {
    _favCar = favCar;
    notifyListeners();
  }

  Future saveUser() async {
    var newBuyer = BuyerModel(
        userid: _userid,
        fullName: _fullName,
        address: _address,
        addressRadius: _addressRadius,
        year: _year,
        program: _program,
        gender: _gender,
        birthday: _birthday,
        userMobile: _userMobile,
        school: _school,
        workStatus: _userType,
        favCar: _favCar,
        distanceDriven: _distanceDriven,
        noOfDoors: _noOfDoors,
        priceRangeStart: _priceRangeStart,
        priceRangeEnd: _priceRangeEnd,
        paymentDuration: _paymentDuration,
        pushToStart: this.pushToStart,
        wifi: this.wifi,
        touchScreen: this.touchScreen,
        bluetooth: this.bluetooth,
        miniFridge: this.miniFridge,
        ac: this.ac,
        tv: this.tv,
        leatherSeat: this.leatherSeat,
        havePet: _havePet,
        cleaningTime: _cleaningTime,
        smoker: _smoker,
        partier: _partier,
        organized: _organized);

    await fireStoreService.insertBuyer(newBuyer);
  }

  Future saveBuyerProfilePicture(File imageFile) async {
    imageDownloadUrl = await fireStoreService.uploadPictureToStorage(imageFile, _userid);
    print('THis si imageDownloadUrl ${imageDownloadUrl}');
  }
}
