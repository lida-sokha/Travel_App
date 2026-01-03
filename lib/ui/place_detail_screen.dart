import 'package:flutter/material.dart';
import 'package:travel_app/models/user_preference.dart';
import '../models/place.dart';

class PlaceDetailScreen extends StatelessWidget {
  final Place place;
  const PlaceDetailScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(place.name)),
      body: ListView(
        children: [
          Image.asset(
            place.imageUrl,
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  place.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(place.location, style: TextStyle(color: Colors.grey[600])),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange),
                    const SizedBox(width: 4),
                    Text(place.rating.toString()),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 16),
                Chip(
                  label: Text(place.travelType.label),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
