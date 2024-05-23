class RoomReservationModel {
  final String id;
  final String hotelId;
  final String roomId;
  final String userId;
  final DateTime checkInDate;
  final DateTime checkOutDate;
  final int numOfRooms;
  final double price;
  final String roomName; // Added room name attribute
  final String roomType; // Added room type attribute

  const RoomReservationModel({
    required this.id,
    required this.hotelId,
    required this.roomId,
    required this.userId,
    required this.checkInDate,
    required this.checkOutDate,
    required this.numOfRooms,
    required this.price,
    required this.roomName,
    required this.roomType,
  });
}
