import 'package:flutter/material.dart';
import 'package:travel_app/widgets/place_card.dart';
import '../widgets/image_carousel.dart';
import '../widgets/recommend_card.dart';
import '../data/places_data.dart';

const String homepapge = 'assets/images/homepage.jpg';
const String kep = 'assets/images/kep.jpg';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(title: Text('Local Travel')),
      body: Column(
        children: [
          ImageCarousel(imagePaths: [kep, homepapge]),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Recently Recommed',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.builder(
                      itemCount: placesData.length,
                      itemBuilder: (context, index) {
                        return PlaceCard(place: placesData[index]);
                      },
                    ),
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
