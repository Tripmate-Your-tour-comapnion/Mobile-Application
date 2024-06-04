// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  String? shopOwner;
  String productName;
  String productDescription;
  List<String> productImages;
  double productPrice;
  int productQuantity;
  int productAvailable;
  String id;

  Product({
    this.shopOwner,
    required this.productName,
    required this.productDescription,
    required this.productImages,
    required this.productPrice,
    required this.productQuantity,
    required this.productAvailable,
    required this.id,
  });

  // Factory constructor to create a Product from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      shopOwner: json['shop_owner'],
      productName: json['product_name'],
      productDescription: json['product_description'],
      productImages: List<String>.from(json['product_images']),
      productPrice: json['product_price'].toDouble(),
      productQuantity: json['product_quantity'],
      productAvailable: json['product_available'],
    );
  }

  // Method to convert Product to JSON
  Map<String, dynamic> toJson() {
    return {
      'shop_owner': shopOwner,
      'product_name': productName,
      'product_description': productDescription,
      'product_images': productImages,
      'product_price': productPrice,
      'product_quantity': productQuantity,
      'product_available': productAvailable,
    };
  }
}
