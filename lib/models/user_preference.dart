import 'package:travel_app/models/question.dart';

enum TravelType { beach, mountain, city, nature }

enum PartnerType { alone, friends, family, partner }

enum BudgetLevel { low, medium, high }

enum ActivityLevel { relaxing, balanced, active }

enum InterestType { localFood, photography, nature, adventure }

extension TravelTypeX on TravelType {
  String get label {
    switch (this) {
      case TravelType.beach:
        return 'Beach';
      case TravelType.mountain:
        return 'Mountain';
      case TravelType.city:
        return 'City';
      case TravelType.nature:
        return 'Nature';
    }
  }
}

extension BudgetLevelTypex on BudgetLevel {
  String get label {
    switch (this) {
      case BudgetLevel.high:
        return 'High';
      case BudgetLevel.medium:
        return 'Medium';
      case BudgetLevel.low:
        return 'Low';
    }
  }
}

extension InterestTypeX on InterestType {
  String get label {
    switch (this) {
      case InterestType.localFood:
        return 'Local Food';
      case InterestType.photography:
        return 'Photography';
      case InterestType.nature:
        return 'Nature';
      case InterestType.adventure:
        return 'Adventure';
    }
  }
}

class UserPreference {
  TravelType? travelType;
  PartnerType? travelPartner;
  BudgetLevel? budgetLevel;
  ActivityLevel? activityLevel;
  InterestType? interest;

  UserPreference({
    this.travelType,
    this.travelPartner,
    this.budgetLevel,
    this.activityLevel,
    this.interest,
  });
  
  void setPreference(QuestionType type, String value) {
    switch (type) {
      case QuestionType.travelType:
        travelType = TravelType.values.firstWhere((e) => e.label == value);
        break;

      case QuestionType.partnerType:
        travelPartner = PartnerType.values.firstWhere(
          (e) => e.name.toLowerCase() == value.toLowerCase(),
        );
        break;

      case QuestionType.budgetLevel:
        budgetLevel = BudgetLevel.values.firstWhere((e) => e.label == value);
        break;

      case QuestionType.activityLevel:
        activityLevel = ActivityLevel.values.firstWhere(
          (e) => e.name.toLowerCase() == value.toLowerCase(),
        );
        break;

      case QuestionType.interest:
        interest = InterestType.values.firstWhere((e) => e.label == value);
        break;
    }
  }

  String? getValByType(QuestionType type) {
    switch (type) {
      case QuestionType.travelType:
        return travelType?.label;
      case QuestionType.partnerType:
        return travelPartner?.name;
      case QuestionType.budgetLevel:
        return budgetLevel?.label;
      case QuestionType.activityLevel:
        return activityLevel?.name;
      case QuestionType.interest:
        return interest?.label;
    }
  }
}
