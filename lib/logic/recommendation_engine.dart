import '../models/place.dart';
import '../models/user_preference.dart';

class RecommendationEngine {
  static List<Place> getRecommendations(
    List<Place> allPlaces,
    UserPreference prefs,
  ) {
    
    final filtered = allPlaces.where((place) {
      if (prefs.travelType == null) return true;
      return place.travelType == prefs.travelType;
    }).toList();

    final scored = filtered.map((place) {
      final score = _calculateScore(place, prefs);
      return MapEntry(place, score);
    }).toList();

    scored.sort((a, b) => b.value.compareTo(a.value));

    return scored.map((e) => e.key).toList();
  }

  static int _calculateScore(Place place, UserPreference prefs) {
    int score = 0;

    if (prefs.budgetLevel != null && place.budgetLevel == prefs.budgetLevel) {
      score += 25;
    }

    if (prefs.interest != null && place.interests.contains(prefs.interest)) {
      score += 25;
    }

    return score;
  }
}
