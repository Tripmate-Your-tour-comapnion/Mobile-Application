class TravelPackage {
  final String id;
  final Agency agency;
  final Package package;

  TravelPackage({
    required this.id,
    required this.agency,
    required this.package,
  });

  factory TravelPackage.fromJson(Map<String, dynamic> json) {
    return TravelPackage(
      id: json['_id'],
      agency: Agency.fromJson(json['agency']),
      package: Package.fromJson(json['package']),
    );
  }
}

class Agency {
  final String id;
  final String fullName;
  final String email;
  final bool confirmed;
  final String password;
  final String role;
  final String verificationStatus;

  Agency({
    required this.id,
    required this.fullName,
    required this.email,
    required this.confirmed,
    required this.password,
    required this.role,
    required this.verificationStatus,
  });

  factory Agency.fromJson(Map<String, dynamic> json) {
    return Agency(
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

class Package {
  final String id;
  final String agent;
  final String packageName;
  final List<String> images;
  final String packageDescription;
  final num packagePrice;
  final num totalSpace;
  final num spaceLeft;

  Package({
    required this.id,
    required this.agent,
    required this.packageName,
    required this.images,
    required this.packageDescription,
    required this.packagePrice,
    required this.totalSpace,
    required this.spaceLeft,
  });

  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
      id: json['_id'],
      agent: json['agent'],
      packageName: json['package_name'],
      images: List<String>.from(json['image'] ?? []),
      packageDescription: json['package_description'],
      packagePrice: json['package_price'],
      totalSpace: json['total_space'],
      spaceLeft: json['space_left'],
    );
  }
}
