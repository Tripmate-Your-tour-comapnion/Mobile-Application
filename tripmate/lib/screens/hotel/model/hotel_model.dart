class HotelModel {
  PaymentInfo? paymentInfo;
  String? hotelId;
  String? companyName;
  String? description;
  String? profileImage;
  String? address;
  List<String>? images;
  String? bussinessLicense;
  int? iV;

  HotelModel(
      {this.paymentInfo,
      this.hotelId,
      this.companyName,
      this.description,
      this.profileImage,
      this.address,
      this.images,
      this.bussinessLicense,
      this.iV});

  HotelModel.fromJson(Map<String, dynamic> json) {
    paymentInfo = json['payment_info'] != null
        ? new PaymentInfo.fromJson(json['payment_info'])
        : null;
    hotelId = json['_id']['_id'];
    companyName = json['company_name'];
    description = json['description'];
    profileImage = json['profile_image'];
    address = json['address'];
    images = json['images'].cast<String>();
    bussinessLicense = json['bussiness_license'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.paymentInfo != null) {
      data['payment_info'] = this.paymentInfo!.toJson();
    }
    data['_id'] = this.hotelId;
    data['company_name'] = this.companyName;
    data['description'] = this.description;
    data['profile_image'] = this.profileImage;
    data['address'] = this.address;
    data['images'] = this.images;
    data['bussiness_license'] = this.bussinessLicense;
    data['__v'] = this.iV;
    return data;
  }
}

class PaymentInfo {
  String? accName;
  String? accNumber;
  String? bank;
  String? subaccountId;

  PaymentInfo({this.accName, this.accNumber, this.bank, this.subaccountId});

  PaymentInfo.fromJson(Map<String, dynamic> json) {
    accName = json['acc_name'];
    accNumber = json['acc_number'];
    bank = json['bank'];
    subaccountId = json['subaccount_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['acc_name'] = this.accName;
    data['acc_number'] = this.accNumber;
    data['bank'] = this.bank;
    data['subaccount_id'] = this.subaccountId;
    return data;
  }
}
