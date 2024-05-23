class BlogModel {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String dateTime;

  BlogModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.dateTime});
}
