class RoomModel {
  final String id;
  final String hotelId; // New property for hotel ID
  final String roomName;
  List<String> roomImage;
  String roomDescription;
  final double roomPrice;
  Map<String, dynamic> roomRate;
  int roomAmount;

  final int roomsAvailable;

  RoomModel({
    required this.roomsAvailable,
    required this.roomAmount,
    required this.roomRate,
    required this.roomImage,
    required this.roomDescription,
    required this.id,
    required this.hotelId,
    required this.roomName,
    required this.roomPrice,
  });
}
