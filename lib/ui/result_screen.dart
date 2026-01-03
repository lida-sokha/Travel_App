import 'package:flutter/material.dart';
import '../models/place.dart';
import '../widgets/place_card.dart'; // Make sure this import is correct

class ResultScreen extends StatefulWidget {
  // 1. Declare the variable here
  final List<Place> recommendedPlaces;

  // 2. Add it to the constructor
  const ResultScreen({super.key, required this.recommendedPlaces});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Matches for You')),
      // 3. Use widget.recommendedPlaces to access the data from the State class
      body: widget.recommendedPlaces.isEmpty
          ? const Center(child: Text("No matches found."))
          : ListView.builder(
              itemCount: widget.recommendedPlaces.length,
              itemBuilder: (context, index) {
                return PlaceCard(place: widget.recommendedPlaces[index]);
              },
            ),
    );
  }
}
