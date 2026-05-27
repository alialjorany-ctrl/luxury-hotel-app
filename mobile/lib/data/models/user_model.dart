class User {
  final String id;
  final String email;
  final String? phone;
  final String firstName;
  final String lastName;
  final String? profileImageUrl;
  final String? nationalId;
  final String nationality;
  final DateTime? dateOfBirth;
  final String? address;
  final String? city;
  final List<String> favoriteHotels;
  final int loyaltyPoints;
  final String vipStatus;
  final bool isBiometricEnabled;
  final DateTime createdAt;
  final DateTime lastLogin;

  User({
    required this.id,
    required this.email,
    this.phone,
    required this.firstName,
    required this.lastName,
    this.profileImageUrl,
    this.nationalId,
    required this.nationality,
    this.dateOfBirth,
    this.address,
    this.city,
    required this.favoriteHotels,
    required this.loyaltyPoints,
    required this.vipStatus,
    required this.isBiometricEnabled,
    required this.createdAt,
    required this.lastLogin,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'],
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      profileImageUrl: json['profileImageUrl'],
      nationalId: json['nationalId'],
      nationality: json['nationality'] ?? '',
      dateOfBirth: json['dateOfBirth'] != null ? DateTime.parse(json['dateOfBirth']) : null,
      address: json['address'],
      city: json['city'],
      favoriteHotels: List<String>.from(json['favoriteHotels'] ?? []),
      loyaltyPoints: json['loyaltyPoints'] ?? 0,
      vipStatus: json['vipStatus'] ?? 'standard',
      isBiometricEnabled: json['isBiometricEnabled'] ?? false,
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toString()),
      lastLogin: DateTime.parse(json['lastLogin'] ?? DateTime.now().toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'phone': phone,
      'firstName': firstName,
      'lastName': lastName,
      'profileImageUrl': profileImageUrl,
      'nationalId': nationalId,
      'nationality': nationality,
      'dateOfBirth': dateOfBirth?.toIso8601String(),
      'address': address,
      'city': city,
      'favoriteHotels': favoriteHotels,
      'loyaltyPoints': loyaltyPoints,
      'vipStatus': vipStatus,
      'isBiometricEnabled': isBiometricEnabled,
      'createdAt': createdAt.toIso8601String(),
      'lastLogin': lastLogin.toIso8601String(),
    };
  }

  String get fullName => '$firstName $lastName';

  User copyWith({
    String? id,
    String? email,
    String? phone,
    String? firstName,
    String? lastName,
    String? profileImageUrl,
    String? nationalId,
    String? nationality,
    DateTime? dateOfBirth,
    String? address,
    String? city,
    List<String>? favoriteHotels,
    int? loyaltyPoints,
    String? vipStatus,
    bool? isBiometricEnabled,
    DateTime? createdAt,
    DateTime? lastLogin,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      nationalId: nationalId ?? this.nationalId,
      nationality: nationality ?? this.nationality,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      address: address ?? this.address,
      city: city ?? this.city,
      favoriteHotels: favoriteHotels ?? this.favoriteHotels,
      loyaltyPoints: loyaltyPoints ?? this.loyaltyPoints,
      vipStatus: vipStatus ?? this.vipStatus,
      isBiometricEnabled: isBiometricEnabled ?? this.isBiometricEnabled,
      createdAt: createdAt ?? this.createdAt,
      lastLogin: lastLogin ?? this.lastLogin,
    );
  }
}
