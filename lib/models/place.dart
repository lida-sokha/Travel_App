class Place {
  final int id;
  final String name;
  final String location;
  final String category; // beach, culture, city, nature
  final double rating;
  final String imageUrl;

  Place({
    required this.id,
    required this.name,
    required this.location,
    required this.category,
    required this.rating,
    required this.imageUrl,
  });
}
