import 'package:flutter/material.dart';
import 'package:travel_app/data/questions_data.dart';
import '../models/question.dart';
import '../data/places_data.dart';
import '../models/user_preference.dart';
import '../logic/recommendation_engine.dart';
import '../widgets/build_questionPage.dart';
import '../ui/result_screen.dart';
import '../widgets/custom_bottom_nav.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int selectedIndex = 0;
  int _currentPage = 0;
  final PageController _pageController = PageController();
  final UserPreference _userPrefs = UserPreference();

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
        centerTitle: true,
        title: Text(
          'Question ${_currentPage + 1} of ${questions.length}',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 45, 48, 71),
        elevation: 0,
        leading: _currentPage > 0
            ? IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => _pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                ),
              )
            : null,
      ),
      body: Column(
        children: [
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
                  selectedOption: _userPrefs.getValByType(
                    questions[index].type,
                  ),
                );
              },
            ),
          ),
        ],
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
