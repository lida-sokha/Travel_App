import 'package:flutter/material.dart';
import '../models/hotel.dart';

class HotelDetailScreen extends StatelessWidget {
  final Hotel hotel;
  const HotelDetailScreen({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(hotel.name)),
      body: ListView(
        children: [
          Image.asset(
            hotel.imageUrl,
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
                  hotel.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange),
                    const SizedBox(width: 4),
                    Text(hotel.rating.toString()),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  '\$${hotel.pricePerNight} per night',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20),

                ElevatedButton(onPressed: () {}, child: const Text('Book Now')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
