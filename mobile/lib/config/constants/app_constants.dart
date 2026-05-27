class AppConstants {
  // API
  static const String baseUrl = 'https://api.luxuryhotelapp.iq';
  static const String wsUrl = 'wss://ws.luxuryhotelapp.iq';

  // Firebase
  static const String firebaseProjectId = 'luxury-hotel-app';

  // Cities
  static const List<String> supportedCities = ['Baghdad', 'Karbala', 'Najaf'];
  static const List<String> arabicCities = ['بغداد', 'كربلاء', 'النجف'];

  // Payment Methods
  static const List<String> paymentMethods = ['visa', 'mastercard', 'wallet', 'cash'];
  static const List<String> arabicPaymentMethods = ['فيزا', 'ماستر كارد', 'محفظة رقمية', 'دفع عند الاستقبال'];

  // Room Types
  static const List<String> roomTypes = ['single', 'double', 'suite', 'penthouse'];
  static const List<String> arabicRoomTypes = ['فردي', 'مزدوج', 'جناح', 'بنتهاوس'];

  // VIP Status
  static const List<String> vipStatus = ['standard', 'silver', 'gold', 'platinum'];
  static const List<String> arabicVipStatus = ['عادي', 'فضي', 'ذهبي', 'بلاتيني'];

  // API Endpoints
  static const String hotelsEndpoint = '/api/hotels';
  static const String roomsEndpoint = '/api/rooms';
  static const String bookingsEndpoint = '/api/bookings';
  static const String authEndpoint = '/api/auth';
  static const String paymentsEndpoint = '/api/payments';
  static const String servicesEndpoint = '/api/services';
  static const String reviewsEndpoint = '/api/reviews';
  static const String usersEndpoint = '/api/users';

  // Pagination
  static const int defaultPageSize = 10;
  static const int maxPageSize = 100;

  // Timeouts
  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);

  // Cache Duration
  static const Duration cacheDuration = Duration(hours: 24);

  // Token Expiry
  static const Duration tokenExpiry = Duration(days: 30);
}
