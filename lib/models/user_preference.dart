enum TravelType { beach, mountain, city, nature }

enum PartnerType { alone, friends, family, partner }

enum BudgetLevel { low, medium, high }

enum ActivityLevel { relaxing, balanced, active }

enum InterestType { localFood, photography, nature, adventure }

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

  void clear() {
    travelType = null;
    travelPartner = null;
    budgetLevel = null;
    activityLevel = null;
    interest = null;
  }
}
