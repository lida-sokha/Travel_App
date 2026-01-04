import '../models/hotel.dart';

class TripHistory {
  final Hotel hotel;
  final String placeName; 
  final double totalPrice;
  final DateTime bookingDate;

  TripHistory({
    required this.hotel,
    required this.placeName,
    required this.totalPrice,
    required this.bookingDate,
  });
}
