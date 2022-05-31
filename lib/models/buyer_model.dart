class BuyerModel {

  final String? userid;
  final String? userMobile;
  final String? fullName;
  final String? birthday;
  final String? gender;
  final String? address;
  final String? addressRadius;
  final String? workStatus;
  final String? school;
  final String? program;
  final String? year;
  final String? favCar;

  //Car details fields
  final String? distanceDriven;
  final String? noOfDoors;
  final String? priceRangeStart;
  final String? priceRangeEnd;
  final String? paymentDuration;

  //Prefered car features
  final bool? pushToStart;
  final bool? wifi;
  final bool? bluetooth;
  final bool? touchScreen;
  final bool? miniFridge;
  final bool? ac;
  final bool? tv;
  final bool? leatherSeat;

  //Buyer extra detial

  bool? havePet;
  String? cleaningTime ;
  String? smoker;
  String? partier;
  String? organized;

  BuyerModel({this.userid,
    this.fullName,
    this.birthday,
    this.userMobile,
    this.gender,
    this.address,
    this.addressRadius,
    this.workStatus,
    this.school,
    this.program,
    this.year,
    this.favCar,
    this.distanceDriven,
    this.noOfDoors,
    this.priceRangeStart,
    this.paymentDuration,
    this.priceRangeEnd,
    this.pushToStart,
    this.wifi,
    this.bluetooth,
    this.touchScreen,
    this.miniFridge,
    this.ac,
    this.tv,
    this.leatherSeat,
    this.havePet,
    this.cleaningTime,
    this.smoker,
    this.partier,
    this.organized


  });

  factory BuyerModel.fromMap(Map<String, dynamic> json) {
    return BuyerModel(
      userid: json['uid'],
      fullName: json['fullName'],
      birthday: json['birthday'],
      userMobile: json['userMobile'],
      gender: json['gender'],
      address: json['address'],
      addressRadius: json['addressRadius'],
      workStatus: json['workStatus'],
      school: json['school'],
      program: json['program'],
      year: json['year'],
      favCar: json['favCar'],
      distanceDriven: json['distanceDriven'],
      noOfDoors: json['noOfDoors'],
      priceRangeStart: json['priceRange'],
      priceRangeEnd: json['priceRangeEnd'],
      paymentDuration: json['paymentDuration'],
      pushToStart: json['pushToStart'],
      wifi: json['wifi'],
      bluetooth: json['bluetooth'],
      touchScreen: json['touchScreen'],
      miniFridge: json['miniFridge'],
      ac: json['ac'],
      tv: json['tv'],
      leatherSeat: json['leatherSeat'],
      havePet: json['havePet'],
      cleaningTime: json['cleaningTime'],
      smoker: json['smoker'],
      partier: json['partier'],
      organized: json['organized'],

    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': userid,
      'fullName': fullName,
      'birthday': birthday,
      'userMobile': userMobile,
      'gender': gender,
      'address': address,
      'addressRadius': addressRadius,
      'workStatus': workStatus,
      'school': school,
      'program': program,
      'year': year,
      'favCar': favCar,
      'distanceDriven': distanceDriven,
      'noOfDoors': noOfDoors,
      'priceRange': priceRangeStart,
      'priceRangeEnd': priceRangeEnd,
      'paymentDuration': paymentDuration,
      'wifi': wifi,
      'bluetooth': bluetooth,
      'touchScreen': touchScreen,
      'miniFridge': miniFridge,
      'ac': ac,
      'tv': tv,
      'leatherSeat': leatherSeat,
      'havePet': havePet,
      'cleaningTime': cleaningTime,
      'smoker': smoker,
      'partier': partier,
      'organized': organized,
    };
  }
}
