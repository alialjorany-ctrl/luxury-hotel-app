class Room {
  final String id;
  final String hotelId;
  final String name;
  final String type;
  final String description;
  final int capacity;
  final double price;
  final double discountedPrice;
  final List<String> amenities;
  final List<String> imageUrls;
  final String view;
  final double area;
  final bool hasBalcony;
  final bool has360View;
  final int availability;
  final DateTime createdAt;

  Room({
    required this.id,
    required this.hotelId,
    required this.name,
    required this.type,
    required this.description,
    required this.capacity,
    required this.price,
    required this.discountedPrice,
    required this.amenities,
    required this.imageUrls,
    required this.view,
    required this.area,
    required this.hasBalcony,
    required this.has360View,
    required this.availability,
    required this.createdAt,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'] ?? '',
      hotelId: json['hotelId'] ?? '',
      name: json['name'] ?? '',
      type: json['type'] ?? '',
      description: json['description'] ?? '',
      capacity: json['capacity'] ?? 1,
      price: (json['price'] ?? 0.0).toDouble(),
      discountedPrice: (json['discountedPrice'] ?? 0.0).toDouble(),
      amenities: List<String>.from(json['amenities'] ?? []),
      imageUrls: List<String>.from(json['imageUrls'] ?? []),
      view: json['view'] ?? '',
      area: (json['area'] ?? 0.0).toDouble(),
      hasBalcony: json['hasBalcony'] ?? false,
      has360View: json['has360View'] ?? false,
      availability: json['availability'] ?? 0,
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'hotelId': hotelId,
      'name': name,
      'type': type,
      'description': description,
      'capacity': capacity,
      'price': price,
      'discountedPrice': discountedPrice,
      'amenities': amenities,
      'imageUrls': imageUrls,
      'view': view,
      'area': area,
      'hasBalcony': hasBalcony,
      'has360View': has360View,
      'availability': availability,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  Room copyWith({
    String? id,
    String? hotelId,
    String? name,
    String? type,
    String? description,
    int? capacity,
    double? price,
    double? discountedPrice,
    List<String>? amenities,
    List<String>? imageUrls,
    String? view,
    double? area,
    bool? hasBalcony,
    bool? has360View,
    int? availability,
    DateTime? createdAt,
  }) {
    return Room(
      id: id ?? this.id,
      hotelId: hotelId ?? this.hotelId,
      name: name ?? this.name,
      type: type ?? this.type,
      description: description ?? this.description,
      capacity: capacity ?? this.capacity,
      price: price ?? this.price,
      discountedPrice: discountedPrice ?? this.discountedPrice,
      amenities: amenities ?? this.amenities,
      imageUrls: imageUrls ?? this.imageUrls,
      view: view ?? this.view,
      area: area ?? this.area,
      hasBalcony: hasBalcony ?? this.hasBalcony,
      has360View: has360View ?? this.has360View,
      availability: availability ?? this.availability,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
