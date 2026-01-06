import 'package:flutter/material.dart';
import '../models/hotel.dart';
import 'booking_screen.dart';

class HotelDetailScreen extends StatelessWidget {
  final Hotel hotel;
  const HotelDetailScreen({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // IMAGE HEADER
          Stack(
            children: [
              Image.asset(
                hotel.imageUrl,
                height: 320,
                width: double.infinity,
                fit: BoxFit.cover,
              ),

              // BACK BUTTON
              Positioned(
                top: 40,
                left: 16,
                child: CircleAvatar(
                  backgroundColor: const Color(0xFF2D3047),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),

              // RATING BADGE
              Positioned(
                bottom: 16,
                right: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9A825),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.star, size: 16, color: Colors.black),
                      const SizedBox(width: 4),
                      Text(
                        hotel.rating.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // CONTENT
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // HOTEL NAME
                  Text(
                    hotel.name,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF111827),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // LOCATION
                  Row(
                    children: const [
                      Icon(
                        Icons.location_on,
                        size: 18,
                        color: Color(0xFF2D3047),
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Cambodia',
                        style: TextStyle(
                          color: Color(0xFF2D3047),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // DESCRIPTION
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF111827),
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'This hotel offers modern comfort, excellent service, and a perfect location for your stay.',
                    style: TextStyle(color: Colors.grey.shade700, height: 1.5),
                  ),

                  const SizedBox(height: 20),

                  // AMENITIES
                  const Text(
                    'Amenities',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF111827),
                    ),
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: const [
                      _Amenity(icon: Icons.wifi, label: 'Wi-Fi'),
                      _Amenity(icon: Icons.pool, label: 'Pool'),
                      _Amenity(icon: Icons.restaurant, label: 'Food'),
                      _Amenity(icon: Icons.local_parking, label: 'Parking'),
                    ],
                  ),

                  const Spacer(),

                  // PRICE BAR
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Price',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            '\$${hotel.pricePerNight}/night',
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2D3047),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 52,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2D3047),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BookingScreen(hotel: hotel),
                              ),
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              'Book Now',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// AMENITY WIDGET
class _Amenity extends StatelessWidget {
  final IconData icon;
  final String label;

  const _Amenity({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xFF2D3047),
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
