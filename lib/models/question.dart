enum QuestionType {
  travelType,
  partnerType,
  budgetLevel,
  activityLevel,
  interest,
}

class Question {
  final int id;
  final String title;
  final List<String> options;
  final QuestionType type;

  Question({
    required this.id,
    required this.title,
    required this.options,
    required this.type,
  });
}
