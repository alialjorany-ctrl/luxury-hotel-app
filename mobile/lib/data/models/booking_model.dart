class Booking {
  final String id;
  final String userId;
  final String hotelId;
  final String roomId;
  final DateTime checkInDate;
  final DateTime checkOutDate;
  final int numberOfGuests;
  final int numberOfNights;
  final double totalPrice;
  final double subtotal;
  final double taxes;
  final String paymentMethod;
  final String paymentStatus;
  final String bookingStatus;
  final String specialRequests;
  final DateTime createdAt;
  final DateTime? cancelledAt;
  final String? cancellationReason;

  Booking({
    required this.id,
    required this.userId,
    required this.hotelId,
    required this.roomId,
    required this.checkInDate,
    required this.checkOutDate,
    required this.numberOfGuests,
    required this.numberOfNights,
    required this.totalPrice,
    required this.subtotal,
    required this.taxes,
    required this.paymentMethod,
    required this.paymentStatus,
    required this.bookingStatus,
    required this.specialRequests,
    required this.createdAt,
    this.cancelledAt,
    this.cancellationReason,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      hotelId: json['hotelId'] ?? '',
      roomId: json['roomId'] ?? '',
      checkInDate: DateTime.parse(json['checkInDate'] ?? DateTime.now().toString()),
      checkOutDate: DateTime.parse(json['checkOutDate'] ?? DateTime.now().toString()),
      numberOfGuests: json['numberOfGuests'] ?? 1,
      numberOfNights: json['numberOfNights'] ?? 1,
      totalPrice: (json['totalPrice'] ?? 0.0).toDouble(),
      subtotal: (json['subtotal'] ?? 0.0).toDouble(),
      taxes: (json['taxes'] ?? 0.0).toDouble(),
      paymentMethod: json['paymentMethod'] ?? '',
      paymentStatus: json['paymentStatus'] ?? 'pending',
      bookingStatus: json['bookingStatus'] ?? 'pending',
      specialRequests: json['specialRequests'] ?? '',
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toString()),
      cancelledAt: json['cancelledAt'] != null ? DateTime.parse(json['cancelledAt']) : null,
      cancellationReason: json['cancellationReason'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'hotelId': hotelId,
      'roomId': roomId,
      'checkInDate': checkInDate.toIso8601String(),
      'checkOutDate': checkOutDate.toIso8601String(),
      'numberOfGuests': numberOfGuests,
      'numberOfNights': numberOfNights,
      'totalPrice': totalPrice,
      'subtotal': subtotal,
      'taxes': taxes,
      'paymentMethod': paymentMethod,
      'paymentStatus': paymentStatus,
      'bookingStatus': bookingStatus,
      'specialRequests': specialRequests,
      'createdAt': createdAt.toIso8601String(),
      'cancelledAt': cancelledAt?.toIso8601String(),
      'cancellationReason': cancellationReason,
    };
  }

  Booking copyWith({
    String? id,
    String? userId,
    String? hotelId,
    String? roomId,
    DateTime? checkInDate,
    DateTime? checkOutDate,
    int? numberOfGuests,
    int? numberOfNights,
    double? totalPrice,
    double? subtotal,
    double? taxes,
    String? paymentMethod,
    String? paymentStatus,
    String? bookingStatus,
    String? specialRequests,
    DateTime? createdAt,
    DateTime? cancelledAt,
    String? cancellationReason,
  }) {
    return Booking(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      hotelId: hotelId ?? this.hotelId,
      roomId: roomId ?? this.roomId,
      checkInDate: checkInDate ?? this.checkInDate,
      checkOutDate: checkOutDate ?? this.checkOutDate,
      numberOfGuests: numberOfGuests ?? this.numberOfGuests,
      numberOfNights: numberOfNights ?? this.numberOfNights,
      totalPrice: totalPrice ?? this.totalPrice,
      subtotal: subtotal ?? this.subtotal,
      taxes: taxes ?? this.taxes,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      bookingStatus: bookingStatus ?? this.bookingStatus,
      specialRequests: specialRequests ?? this.specialRequests,
      createdAt: createdAt ?? this.createdAt,
      cancelledAt: cancelledAt ?? this.cancelledAt,
      cancellationReason: cancellationReason ?? this.cancellationReason,
    );
  }
}
