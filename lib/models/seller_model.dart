class SellerModel {
  final String? userid;
  final String? fullName;
  final String? gender;
  final String? address;
  final String? phone;
  //car detail
  final String? distanceDriven;
  final String? priceRangeStart;
  final String? priceRangeEnd;
  final String? leaseDuration;
  final String? leaserCar;
  final String? carType;
  SellerModel(
      {this.userid,
        this.fullName,
        this.gender,
        this.address,
        this.phone,
        this.distanceDriven,
        this.priceRangeStart,
        this.priceRangeEnd,
        this.leaseDuration,
        this.leaserCar,
        this.carType
      });

  factory SellerModel.fromMap(Map<String, dynamic> json) {
    return SellerModel(
        userid: json['uid'],
        fullName: json['fullName'],
        gender: json['gender'],
        address: json['address'],
      phone: json['phone'],
      distanceDriven: json['distanceDriven'],
      priceRangeStart: json['priceRangeStart'],
      priceRangeEnd: json['priceRangeEnd'],
      leaseDuration: json['leaseDuration'],
      leaserCar: json['leaserCar'],
      carType: json['carType']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': userid,
      'fullName': fullName,
      'gender': gender,
      'address': address,
      'phone' : phone,
      'distanceDriven': distanceDriven,
      'priceRangeStart': priceRangeStart,
      'priceRangeEnd': priceRangeEnd,
      'leaseDuration' : leaseDuration,
      'leaserCar' : leaserCar,
      'carType' : carType,
    };
  }
}