import 'package:flutter/material.dart';
import '../models/hotel.dart';
import '../ui/hotel_detail_screen.dart';

class HotelScreen extends StatelessWidget {
  final List<Hotel> hotels;
  const HotelScreen({super.key, required this.hotels});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: hotels.length,
      itemBuilder: (context, index) {
        final hotel = hotels[index];

        return ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              hotel.imageUrl,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(hotel.name),
          subtitle: Text('\$${hotel.pricePerNight}/night'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.star, size: 16, color: Colors.orange),
              Text(hotel.rating.toString()),
            ],
          ),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => HotelDetailScreen(hotel: hotel),
              ),
            );
          },
        );
      },
    );
  }
}
