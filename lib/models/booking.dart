class Booking {
  final int id;
  final int hotelId;
  final int placeId;
  final DateTime checkInDate;
  final DateTime checkOutDate;
  final int numberOfGuests;
  final double totalPrice;
  final DateTime createdAt;

  Booking({
    required this.id,
    required this.hotelId,
    required this.placeId,
    required this.checkInDate,
    required this.checkOutDate,
    required this.numberOfGuests,
    required this.totalPrice,
    required this.createdAt,
  });

  int get totalNights {
    return checkOutDate.difference(checkInDate).inDays;
  }
}
