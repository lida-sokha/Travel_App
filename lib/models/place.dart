import 'user_preference.dart';

class Place {
  final int id;
  final String name;
  final String location;
  final TravelType travelType;
  final double rating;
  final String imageUrl;

  Place({
    required this.id,
    required this.name,
    required this.location,
    required this.travelType,
    required this.rating,
    required this.imageUrl,
  });
}
