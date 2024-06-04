import 'package:tripmate/core/app_exports.dart';

class Shop {
  PaymentInfo? paymentInfo;
  String? companyName;
  String? description;
  String? address;
  List<String>? imageUrls;
  String? businessLicense;
  String? ownerId;

  Shop({
    required this.paymentInfo,
    required this.companyName,
    required this.description,
    required this.address,
    required this.imageUrls,
    required this.businessLicense,
    required this.ownerId
  });

  Shop.fromJson(Map<String, dynamic> json) {
    ownerId = json['_id'];
    companyName = json['company_name'];
    paymentInfo = json['payment_info'] != null
        ? PaymentInfo.fromJson(json['payment_info'])
        : null;
    imageUrls = List<String>.from(json['images']);
    description = json['description'];
    address = json['address'];
    businessLicense = json['business_license'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['company_name'] = companyName;
    data['payment_info'] = paymentInfo?.toJson();
    data['images'] = imageUrls;
    data['description'] = description;
    data['address'] = address;
    data['business_license'] = businessLicense;
    return data;
  }
}

class PaymentInfo {
  String? accountName;
  String? accountNumber;
  String? bank;
  String? subaccountId;

  PaymentInfo({
    required this.accountName,
    required this.accountNumber,
    required this.bank,
    required this.subaccountId,
  });

  PaymentInfo.fromJson(Map<String, dynamic> json) {
    accountName = json['acc_name'];
    accountNumber = json['acc_number'];
    bank = json['bank'];
    subaccountId = json['subaccount_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['acc_name'] = accountName;
    data['acc_number'] = accountNumber;
    data['bank'] = bank;
    data['subaccount_id'] = subaccountId;
    return data;
  }
}
