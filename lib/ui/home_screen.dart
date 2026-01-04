import 'package:flutter/material.dart';
import 'package:travel_app/widgets/place_card.dart';
import '../widgets/image_carousel.dart';
import '../data/places_data.dart';
import '../widgets/custom_bottom_nav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 1;
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(title: const Text('Local Travel')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount = 1;

          if (constraints.maxWidth >= 900) {
            crossAxisCount = 3; // desktop
          } else if (constraints.maxWidth >= 600) {
            crossAxisCount = 2; // tablet
          }

          return ListView(
            children: [
              ImageCarousel(
                imagePaths: placesData.map((place) => place.imageUrl).toList(),
              ),

              const SizedBox(height: 20),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Place to Explore',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 15),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: placesData.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 1.0,
                  ),
                  itemBuilder: (context, index) {
                    return PlaceCard(place: placesData[index]);
                  },
                ),
              ),
            ],
          );
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
