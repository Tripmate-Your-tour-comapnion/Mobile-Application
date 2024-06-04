class Destination {
  String? sId;
  String? destName;
  DestLocation? destLocation;
  String? destImage;
  String? destDescription;
  int? iV;

  Destination(
      {this.sId,
      this.destName,
      this.destLocation,
      this.destImage,
      this.destDescription,
      this.iV});

  Destination.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    destName = json['dest_name'];
    destLocation = json['dest_location'] != null
        ? new DestLocation.fromJson(json['dest_location'])
        : null;
    destImage = json['dest_image'];
    destDescription = json['dest_description'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = sId;
    data['dest_name'] = destName;
    if (destLocation != null) {
      data['dest_location'] = destLocation!.toJson();
    }
    data['dest_image'] = destImage;
    data['dest_description'] = destDescription;
    data['__v'] = iV;
    return data;
  }
}

class DestLocation {
  double? lat;
  double? lng;
  String? sId;

  DestLocation({this.lat, this.lng, this.sId});

  DestLocation.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = lat;
    data['lng'] = lng;
    data['_id'] = sId;
    return data;
  }
}
