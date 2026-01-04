import '../models/place.dart';
import '../models/user_preference.dart';

class RecommendationEngine {
  static List<Place> getRecommendations(
    List<Place> allPlaces,
    UserPreference prefs,
  ) {
    // STEP 1: Filter the list (Only keep the category the user wants)
    List<Place> filteredResults = allPlaces.where((place) {
      // If user hasn't picked anything, show everything.
      // If they picked Beach, only return places where travelType is Beach.
      if (prefs.travelType == null) return true;
      return place.travelType == prefs.travelType;
    }).toList();

    // STEP 2: Sort the filtered list (Rank the best beaches at the top)
    filteredResults.sort((a, b) {
      int scoreA = _calculateScore(a, prefs);
      int scoreB = _calculateScore(b, prefs);
      return scoreB.compareTo(scoreA);
    });

    return filteredResults;
  }

  static int _calculateScore(Place place, UserPreference prefs) {
    int score = 0;
    // Since travelType is already matched in Step 1, we score based on other details
    if (place.activityLevel == prefs.activityLevel) score += 5;
    if (place.budgetLevel == prefs.budgetLevel) score += 2;
    return score;
  }
}
