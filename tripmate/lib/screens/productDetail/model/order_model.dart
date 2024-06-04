class Order {
  final String productId;
  final int quantity;

  Order({required this.productId, this.quantity = 1});

  // Factory constructor to create an Order object from JSON
  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      productId: json['productId'] as String,
      quantity: json['quantity'] as int? ?? 1, // Default value if null
    );
  }

  // Method to convert an Order object to JSON
  Map<String, dynamic> toJson() {
    return {
      'pid': productId,
      'quantity': quantity,
    };
  }
}
