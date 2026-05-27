class Hotel {
  final String id;
  final String name;
  final String city;
  final String address;
  final String description;
  final double rating;
  final int reviewCount;
  final List<String> imageUrls;
  final List<String> amenities;
  final Map<String, dynamic> location;
  final bool isFavorite;
  final DateTime createdAt;

  Hotel({
    required this.id,
    required this.name,
    required this.city,
    required this.address,
    required this.description,
    required this.rating,
    required this.reviewCount,
    required this.imageUrls,
    required this.amenities,
    required this.location,
    this.isFavorite = false,
    required this.createdAt,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      city: json['city'] ?? '',
      address: json['address'] ?? '',
      description: json['description'] ?? '',
      rating: (json['rating'] ?? 0.0).toDouble(),
      reviewCount: json['reviewCount'] ?? 0,
      imageUrls: List<String>.from(json['imageUrls'] ?? []),
      amenities: List<String>.from(json['amenities'] ?? []),
      location: json['location'] ?? {},
      isFavorite: json['isFavorite'] ?? false,
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'city': city,
      'address': address,
      'description': description,
      'rating': rating,
      'reviewCount': reviewCount,
      'imageUrls': imageUrls,
      'amenities': amenities,
      'location': location,
      'isFavorite': isFavorite,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  Hotel copyWith({
    String? id,
    String? name,
    String? city,
    String? address,
    String? description,
    double? rating,
    int? reviewCount,
    List<String>? imageUrls,
    List<String>? amenities,
    Map<String, dynamic>? location,
    bool? isFavorite,
    DateTime? createdAt,
  }) {
    return Hotel(
      id: id ?? this.id,
      name: name ?? this.name,
      city: city ?? this.city,
      address: address ?? this.address,
      description: description ?? this.description,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      imageUrls: imageUrls ?? this.imageUrls,
      amenities: amenities ?? this.amenities,
      location: location ?? this.location,
      isFavorite: isFavorite ?? this.isFavorite,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
