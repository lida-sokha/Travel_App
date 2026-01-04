import 'package:flutter/material.dart';
import 'package:travel_app/widgets/place_card.dart';
import '../widgets/image_carousel.dart';
import '../data/places_data.dart';
import '../widgets/custom_bottom_nav.dart';
import '../logic/history_analyzer.dart';
import '../data/trip_history_data.dart';
import '../widgets/recommend_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showAll = false;
  int selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    final preferredType = HistoryAnalyzer.getPreferredCategory(tripHistoryData);
    final historyRecommendations = placesData
        .where((place) => place.travelType == preferredType)
        .toList();

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
              
              if (historyRecommendations.isNotEmpty) ...[
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Text(
                    "Recommended For You",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 250, 
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 20),
                    itemCount: historyRecommendations.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 200, 
                        margin: const EdgeInsets.only(right: 15),
                        child: RecommendCard(
                          place: historyRecommendations[index],
                        ),
                      );
                    },
                  ),
                ),
              ],

              const SizedBox(height: 20),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Place to Explore',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _showAll
                      ? placesData.length
                      : (placesData.length > 4 ? 4 : placesData.length),
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
              if (!_showAll && placesData.length > 4)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                    child: TextButton.icon(
                      onPressed: () {
                        setState(() {
                          _showAll = true;
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Color.fromARGB(255, 45, 48, 71),
                      ),
                      label: const Text(
                        'View More',
                        style: TextStyle(
                          color: Color.fromARGB(255, 45, 48, 71),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
