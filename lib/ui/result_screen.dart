import 'package:flutter/material.dart';
import '../models/place.dart';
import '../widgets/place_card.dart';
import '../widgets/custom_bottom_nav.dart';

class ResultScreen extends StatefulWidget {
  final List<Place> recommendedPlaces;

  const ResultScreen({super.key, required this.recommendedPlaces});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Matches for You')),
      body: widget.recommendedPlaces.isEmpty
          ? const Center(child: Text("No matches found."))
          : ListView.builder(
              itemCount: widget.recommendedPlaces.length,
              itemBuilder: (context, index) {
                return PlaceCard(place: widget.recommendedPlaces[index]);
              },
            ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
