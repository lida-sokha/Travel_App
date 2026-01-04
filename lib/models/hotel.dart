class Hotel {
  final int id;
  final int placeId; 
  final String name;
  final double pricePerNight;
  final double rating;
  final String imageUrl;
  final String bookingUrl;

  Hotel({
    required this.id,
    required this.placeId,
    required this.name,
    required this.pricePerNight,
    required this.rating,
    required this.imageUrl,
    required this.bookingUrl,
  });
}
