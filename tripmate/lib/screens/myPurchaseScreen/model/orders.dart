class Purchase {
  final String id;
  final Shop shop;
  final String customer; // Change type to String
  final Product product;

  Purchase({
    required this.id,
    required this.shop,
    required this.customer,
    required this.product,
  });

  factory Purchase.fromJson(Map<String, dynamic> json) {
    return Purchase(
      id: json['_id'],
      shop: Shop.fromJson(json['shop']),
      customer: json['customer'], // Parse as String
      product: Product.fromJson(json['product']),
    );
  }
}

class Shop {
  final String id;
  final String fullName;
  final String email;
  final bool confirmed;
  final String password;
  final String role;
  final String verificationStatus;

  Shop({
    required this.id,
    required this.fullName,
    required this.email,
    required this.confirmed,
    required this.password,
    required this.role,
    required this.verificationStatus,
  });

  factory Shop.fromJson(Map<String, dynamic> json) {
    return Shop(
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

class Customer {
  final String id;

  Customer({
    required this.id,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['_id'],
    );
  }
}

class Product {
  final String id;
  final String shopOwner;
  final String productName;
  final String productDescription;
  final List<String> productImages;
  final int productPrice;
  final int productQuantity;

  Product({
    required this.id,
    required this.shopOwner,
    required this.productName,
    required this.productDescription,
    required this.productImages,
    required this.productPrice,
    required this.productQuantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      shopOwner: json['shop_owner'],
      productName: json['product_name'],
      productDescription: json['product_description'],
      productImages: List<String>.from(json['product_images']),
      productPrice: json['product_price'],
      productQuantity: json['product_quantity'],
    );
  }
}
