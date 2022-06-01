import 'package:carify_app/models/seller_model.dart';
import 'package:carify_app/services/firestore_service.dart';
import 'package:flutter/cupertino.dart';

class SellerProvider extends ChangeNotifier {
  MyFireStoreService fireStoreService = MyFireStoreService();

  String userid = "";
  String _fullName = "";
  String _gender = "";
  String _address = "";
  String _phone = "";

  String _distanceDriven = "";
  String _priceRangeStart = "";
  String _priceRangeEnd = "";
  String _leaseDuration = "";
  String _leaserCar = "";
  String _carType = "";

  set changeDistanceDriven(String value) {
    _distanceDriven = value;
    notifyListeners();
  }

  set changePriceRangeStart(String value) {
    _priceRangeStart = value;
    notifyListeners();
  }

  set changePriceRangeEnd(String value) {
    _priceRangeEnd = value;
    notifyListeners();
  }

  set changeLeaseDuration(String value) {
    _leaseDuration = value;
    notifyListeners();
  }

  set changeLeaserCar(String value) {
    _leaserCar = value;
    notifyListeners();
  }

  set changeCarType(String value) {
    _carType = value;
    notifyListeners();
  }

  set changeuid(String uid) {
    userid = uid;
    notifyListeners();
  }

  set changeName(String name) {
    print('I am gonna set this $name');
    _fullName = name;
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

  set changePhone(String phone) {
    _phone = phone;
    notifyListeners();
  }

  saveUser() async {
    var newSeller = SellerModel(
        userid: userid,
        fullName: _fullName,
        address: _address,
        gender: _gender,
        phone: _phone,
        distanceDriven: _distanceDriven,
        priceRangeStart: _priceRangeStart,
        priceRangeEnd: _priceRangeEnd,
        leaseDuration: _leaseDuration,
        leaserCar: _leaserCar,
        carType: _carType);

    await fireStoreService.insertSeller(newSeller);
  }
}
