import '../models/place.dart';
import '../models/user_preference.dart';
class RecommendationEngine {
  static List<Place> getRecommendations(List<Place> allPlaces, UserPreference prefs) {
    return allPlaces.where((place) {
      // Optional: Strict filtering (only show places that match travel type)
      if (prefs.travelType != null && place.category != prefs.travelType) {
        return false; 
      }
      return true;
    }).toList()
    ..sort((a, b) {
      // Scoring logic
      int scoreA = _calculateScore(a, prefs);
      int scoreB = _calculateScore(b, prefs);
      return scoreB.compareTo(scoreA); // Highest score first
    });
  }

  static int _calculateScore(Place place, UserPreference prefs) {
  int score = 0;
  
  // Ensure place.travelType is an Enum or compare using .name
  if (place.travelType == prefs.travelType) score += 3;
  if (place.activityLevel == prefs.activityLevel) score += 2;
  if (place.budgetLevel == prefs.budgetLevel) score += 1;
  
  return score;
}
}