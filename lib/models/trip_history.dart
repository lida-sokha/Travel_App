// trip_history.dart
import '../models/hotel.dart';

class TripHistory {
  final Hotel hotel;
  final String placeName; // Store the name directly for easy access
  final double totalPrice;
  final DateTime bookingDate;

  TripHistory({
    required this.hotel,
    required this.placeName,
    required this.totalPrice,
    required this.bookingDate,
  });
}
