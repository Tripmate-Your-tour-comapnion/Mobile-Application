// ignore_for_file: unnecessary_new, prefer_collection_literals

class TourpackageModel {
  String? iId;
  String? agent;
  String? packageName;
  List<String>? image;
  String? packageDescription;
  int? packagePrice;
  int? totalSpace;
  int? spaceLeft;
  int? iV;

  TourpackageModel(
      {this.iId,
      this.agent,
      this.packageName,
      this.image,
      this.packageDescription,
      this.packagePrice,
      this.totalSpace,
      this.spaceLeft,
      this.iV});

  TourpackageModel.fromJson(Map<String, dynamic> json) {
    iId = json['_id'];
    agent = json['agent'];
    packageName = json['package_name'];
    if (json['image'] is String) {
      image = [json['image']];
    } else if (json['image'] is List) {
      image = (json['image'] as List).map((item) => item.toString()).toList();
    }
    packageDescription = json['package_description'];
    packagePrice = json['package_price'];
    totalSpace = json['total_space'];
    spaceLeft = json['space_left'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (iId != null) {
      data['_id'] = iId!;
    }
    if (agent != null) {
      data['agent'] = agent!;
    }
    data['package_name'] = packageName;
    data['image'] = image;
    data['package_description'] = packageDescription;
    data['package_price'] = packagePrice;
    data['total_space'] = totalSpace;
    data['space_left'] = spaceLeft;
    data['__v'] = iV;
    return data;
  }
}
