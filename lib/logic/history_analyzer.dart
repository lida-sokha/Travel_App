import '../models/trip_history.dart';
import '../data/places_data.dart';
import '../models/user_preference.dart';

class HistoryAnalyzer {
  static TravelType? getPreferredCategory(List<TripHistory> history) {
    if (history.isEmpty) return null;

    Map<TravelType, int> categoryCounts = {};

    for (var trip in history) {
      final place = placesData.firstWhere(
        (p) => p.name == trip.placeName,
        orElse: () => placesData.first,
      );

      final TravelType type = place.travelType;

      categoryCounts[type] = (categoryCounts[type] ?? 0) + 1;
    }

    var sortedEntries = categoryCounts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return sortedEntries.first.key;
  }
}
