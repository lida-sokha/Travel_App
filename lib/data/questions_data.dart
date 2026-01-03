import '../models/question.dart';
import '../models/user_preference.dart';

final List<Question> questions = [
  Question(
    id: 1,
    title: 'What type of place do you prefer?',
    options: ['City', 'Nature', 'Beach', 'Mountain'],
    type: QuestionType.travelType,
  ),
  Question(
    id: 2,
    title: 'Who are you traveling with?',
    options: ['Alone', 'Friends', 'Family', 'Partner'],
    type: QuestionType.partnerType,
  ),
  Question(
    id: 3,
    title: 'What is your travel budget?',
    options: ['Low', 'Medium', 'High'],
    type: QuestionType.budgetLevel,
  ),
  Question(
    id: 4,
    title: 'How active do you want your trip to be?',
    options: ['Relaxing', 'Balanced', 'Active'],
    type: QuestionType.activityLevel,
  ),
  Question(
    id: 5,
    title: 'What are you most interested in?',
    options: ['Local Food', 'Photography', 'Nature', 'Adventure'],
    type: QuestionType.interest,
  ),
];
