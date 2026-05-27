class Review {
  final String id;
  final String hotelId;
  final String userId;
  final String userName;
  final double rating;
  final String title;
  final String comment;
  final List<String> imageUrls;
  final int helpful;
  final DateTime createdAt;

  Review({
    required this.id,
    required this.hotelId,
    required this.userId,
    required this.userName,
    required this.rating,
    required this.title,
    required this.comment,
    required this.imageUrls,
    required this.helpful,
    required this.createdAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'] ?? '',
      hotelId: json['hotelId'] ?? '',
      userId: json['userId'] ?? '',
      userName: json['userName'] ?? '',
      rating: (json['rating'] ?? 0.0).toDouble(),
      title: json['title'] ?? '',
      comment: json['comment'] ?? '',
      imageUrls: List<String>.from(json['imageUrls'] ?? []),
      helpful: json['helpful'] ?? 0,
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'hotelId': hotelId,
      'userId': userId,
      'userName': userName,
      'rating': rating,
      'title': title,
      'comment': comment,
      'imageUrls': imageUrls,
      'helpful': helpful,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
