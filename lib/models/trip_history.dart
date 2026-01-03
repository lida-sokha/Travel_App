import 'booking.dart';

class TripHistory {
  final int id;
  final Booking booking;
  final bool isCompleted;
  final DateTime completedAt;

  TripHistory({
    required this.id,
    required this.booking,
    required this.isCompleted,
    required this.completedAt,
  });
}
