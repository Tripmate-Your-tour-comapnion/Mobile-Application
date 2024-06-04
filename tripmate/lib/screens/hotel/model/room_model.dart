// ignore_for_file: unnecessary_new

class RoomModel {
  String? roomId;
  String? owner;
  String? roomName;
  List<String>? roomImage;
  String? roomDescription;
  int? roomPrice;
  int? roomAmount;
  int? roomAvailable;
  RoomRate? roomRate;
  int? iV;

  RoomModel(
      {this.roomId,
      this.owner,
      this.roomName,
      this.roomImage,
      this.roomDescription,
      this.roomPrice,
      this.roomAmount,
      this.roomAvailable,
      this.roomRate,
      this.iV});

  RoomModel.fromJson(Map<String, dynamic> json) {
    roomId = json['_id'];
    owner = json['owner'];
    roomName = json['room_name'];
    roomImage = json['room_image'].cast<String>();
    roomDescription = json['room_description'];
    roomPrice = json['room_price'];
    roomAmount = json['room_amount'];
    roomAvailable = json['room_available'];
    roomRate =
        json['room_rate'] != null ? RoomRate.fromJson(json['room_rate']) : null;
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (roomId != null) {
      data['_id'] = roomId;
    }
    if (owner != null) {
      data['owner'] = owner;
    }
    data['room_name'] = roomName;
    data['room_image'] = roomImage;
    data['room_description'] = roomDescription;
    data['room_price'] = roomPrice;
    data['room_amount'] = roomAmount;
    data['room_available'] = roomAvailable;
    if (roomRate != null) {
      data['room_rate'] = roomRate!.toJson();
    }
    data['__v'] = iV;
    return data;
  }
}

class Id {
  String? oid;

  Id({this.oid});

  Id.fromJson(Map<String, dynamic> json) {
    oid = json['$oid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['$oid'] = oid;
    return data;
  }
}

class RoomRate {
  double? value;
  double? total;
  int? raterNumber;

  RoomRate({this.value, this.total, this.raterNumber});

  RoomRate.fromJson(Map<String, dynamic> json) {
    value = double.parse(json['value'].toString());
    total = double.parse(json['total'].toString());
    raterNumber = json['rater_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['total'] = total;
    data['rater_number'] = raterNumber;
    return data;
  }
}
