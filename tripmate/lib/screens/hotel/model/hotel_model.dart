class HotelModel {
  final int id;
  final String name;
  final String location;
  final double rate;
  final List<String> services;
  final List<String> imgs;
  final double price;
  final String description;

  HotelModel({
    required this.id,
    required this.name,
    required this.location,
    required this.rate,
    required this.services,
    required this.imgs,
    required this.price,
    required this.description,
  });
}
