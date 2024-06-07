class Reservation {
  final String id;
  final Hotel hotel;
  final Room room;

  Reservation({required this.id, required this.hotel, required this.room});

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      id: json['_id'],
      hotel: Hotel.fromJson(json['hotel']),
      room: Room.fromJson(json['room']),
    );
  }
}

class Hotel {
  final String id;
  final String fullName;
  final String email;
  final bool confirmed;
  final String password;
  final String role;
  final String verificationStatus;

  Hotel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.confirmed,
    required this.password,
    required this.role,
    required this.verificationStatus,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      id: json['_id'],
      fullName: json['full_name'],
      email: json['email'],
      confirmed: json['confirmed'],
      password: json['password'],
      role: json['role'],
      verificationStatus: json['verification_status'],
    );
  }
}

class Room {
  final String id;
  final RoomRate roomRate;
  final String owner;
  final String roomName;
  final List<String> roomImage;
  final String roomDescription;
  final num roomPrice;
  final num roomAmount;
  final num roomAvailable;

  Room({
    required this.id,
    required this.roomRate,
    required this.owner,
    required this.roomName,
    required this.roomImage,
    required this.roomDescription,
    required this.roomPrice,
    required this.roomAmount,
    required this.roomAvailable,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['_id'],
      roomRate: RoomRate.fromJson(json['room_rate']),
      owner: json['owner'],
      roomName: json['room_name'],
      roomImage: List<String>.from(json['room_image']),
      roomDescription: json['room_description'],
      roomPrice: json['room_price'],
      roomAmount: json['room_amount'],
      roomAvailable: json['room_available'],
    );
  }
}

class RoomRate {
  final num value;
  final num total;
  final int raterNumber;

  RoomRate({
    required this.value,
    required this.total,
    required this.raterNumber,
  });

  factory RoomRate.fromJson(Map<String, dynamic> json) {
    return RoomRate(
      value: json['value'],
      total: json['total'],
      raterNumber: json['rater_number'],
    );
  }
}
