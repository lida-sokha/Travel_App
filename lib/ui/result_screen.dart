import 'package:flutter/material.dart';
import 'package:travel_app/ui/home_screen.dart';
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
      bottomNavigationBar: CustomBottomNav(
        currentIndex: selectedIndex,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          } else {
            setState(() {
              selectedIndex = index;
            });
          }
        },
      ),
    );
  }
}
