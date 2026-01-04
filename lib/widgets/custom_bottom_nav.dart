import 'package:flutter/material.dart';
import '../ui/question_screen.dart'; // Adjust path based on your folder structure

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      elevation: 8,
      selectedItemColor: const Color(0xFF4DD0E1),
      unselectedItemColor: Colors.grey,
      currentIndex: currentIndex,
      onTap: (index) {
        if (index == 0) {
          // Check if we are already in the "Recommend" flow
          // If we are on the ResultScreen, the currentIndex is likely 0
          if (currentIndex == 0) {
            // Logic: If user is on Results and clicks Recommend,
            // maybe restart the quiz or do nothing.
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const QuestionScreen()),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const QuestionScreen()),
            );
          }
        } else if (index == 1) {
          // Logic: If user clicks HOME from the ResultScreen,
          // we should pop back to the actual Home page instead of pushing a new one.
          if (Navigator.canPop(context)) {
            Navigator.popUntil(context, (route) => route.isFirst);
          }
          onTap(index);
        } else {
          onTap(index);
        }
      },
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.auto_awesome,
            size: 28,
          ), // Changed icon to look better for "Recommend"
          label: 'Recommend',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 28),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history, size: 28),
          label: 'History',
        ),
      ],
    );
  }
}
