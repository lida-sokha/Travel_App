import 'package:flutter/material.dart';
import 'package:travel_app/data/questions_data.dart';
import '../models/question.dart';
import '../data/places_data.dart';
import '../models/user_preference.dart';
import '../logic/recommendation_engine.dart';
import '../widgets/build_questionPage.dart';
import '../ui/result_screen.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final PageController _pageController = PageController();
  final UserPreference _userPrefs = UserPreference();
  int _currentPage = 0;
  void _onOptionSelected(QuestionType type, String value) {
    setState(() {
      _userPrefs.setPreference(type, value);
    });

    // Automatically move to next page with a slight delay for better UX
    if (_currentPage < questions.length - 1) {
      Future.delayed(const Duration(milliseconds: 300), () {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    } else {
      _finishQuiz();
    }
  }

  void _finishQuiz() {
    final recommendedPlaces = RecommendationEngine.getRecommendations(
      placesData,
      _userPrefs,
    );

    // FIX: Navigate to your ResultScreen and pass the data
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ResultScreen(recommendedPlaces: recommendedPlaces),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: _currentPage > 0
            ? IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => _pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                ),
              )
            : null,
      ),
      body: Column(
        children: [
          // Progress Bar
          LinearProgressIndicator(
            value: (_currentPage + 1) / questions.length,
            backgroundColor: Colors.grey[200],
            color: const Color(0xFF4DD0E1),
          ),

          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: questions.length,
              itemBuilder: (context, index) {
                return QuestionPage(
                  question: questions[index],
                  // This tells the widget what to do when tapped
                  onOptionSelected: (value) {
                    _onOptionSelected(questions[index].type, value);
                  },
                  // Optional: pass the currently stored preference to show it's selected
                  selectedOption: _userPrefs.getValByType(
                    questions[index].type,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
