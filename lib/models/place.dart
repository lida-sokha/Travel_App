import 'user_preference.dart';

class Place {
  final int id;
  final String name;
  final String location;
  final String category;
  final double rating;
  final String imageUrl;

  final TravelType travelType;
  final ActivityLevel activityLevel; // Added
  final BudgetLevel budgetLevel;

  Place({
    required this.id,
    required this.name,
    required this.location,
    required this.category,
    required this.rating,
    required this.imageUrl,
    required this.travelType,
    required this.activityLevel, // Added to constructor
    required this.budgetLevel,
  });

}
