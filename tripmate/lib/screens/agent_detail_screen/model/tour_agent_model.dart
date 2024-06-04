// ignore_for_file: unnecessary_new, prefer_collection_literals

class TourAgentModel {
  PaymentInfo? paymentInfo;
  String? agentId;
  String? companyName;
  String? description;
  String? profileImage;
  String? address;
  List<String>? images;
  String? bussinessLicense;
  int? iV;

  TourAgentModel(
      {this.paymentInfo,
      this.agentId,
      this.companyName,
      this.description,
      this.profileImage,
      this.address,
      this.images,
      this.bussinessLicense,
      this.iV});

  TourAgentModel.fromJson(Map<String, dynamic> json) {
    paymentInfo = json['payment_info'] != null
        ? new PaymentInfo.fromJson(json['payment_info'])
        : null;
    agentId = json['_id'];
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
    if (paymentInfo != null) {
      data['payment_info'] = paymentInfo!.toJson();
    }
    data['_id'] = agentId;
    data['company_name'] = companyName;
    data['description'] = description;
    data['profile_image'] = profileImage;
    data['address'] = address;
    data['images'] = images;
    data['bussiness_license'] = bussinessLicense;
    data['__v'] = iV;
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
    data['acc_name'] = accName;
    data['acc_number'] = accNumber;
    data['bank'] = bank;
    data['subaccount_id'] = subaccountId;
    return data;
  }
}
