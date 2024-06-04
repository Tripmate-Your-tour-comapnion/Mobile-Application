class RoomReservationModel {
  Id? iId;
  Id? hotel;
  Id? room;
  Id? customer;
  String? txRef;
  String? from;
  String? to;
  int? quantity;
  int? price;
  String? status;
  int? iV;

  RoomReservationModel(
      {this.iId,
      this.hotel,
      this.room,
      this.customer,
      this.txRef,
      this.from,
      this.to,
      this.quantity,
      this.price,
      this.status,
      this.iV});

  RoomReservationModel.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? new Id.fromJson(json['_id']) : null;
    hotel = json['hotel'] != null ? new Id.fromJson(json['hotel']) : null;
    room = json['room'] != null ? new Id.fromJson(json['room']) : null;
    customer =
        json['customer'] != null ? new Id.fromJson(json['customer']) : null;
    txRef = json['tx_ref'];
    from = json['from'];
    to = json['to'];
    quantity = json['quantity'];
    price = json['price'];
    status = json['status'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.iId != null) {
      data['_id'] = this.iId!.toJson();
    }
    if (this.hotel != null) {
      data['hotel'] = this.hotel!.toJson();
    }
    if (this.room != null) {
      data['room'] = this.room!.toJson();
    }
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    data['tx_ref'] = this.txRef;
    data['from'] = this.from;
    data['to'] = this.to;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['status'] = this.status;
    data['__v'] = this.iV;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$oid'] = this.oid;
    return data;
  }
}
