import 'package:flutter/foundation.dart';
import 'package:recipes_app/src/controllers/constaints.dart';
import 'package:recipes_app/src/models/meal_model.dart';
import 'package:recipes_app/src/repositories/recipes_repositories.dart';

class MealPageController {
  final status = ValueNotifier(Status.start);
  final repository = FetchRecipes(null);
  late List<Meal> meals;

  start() async {
    try {
      status.value = Status.loading;
      meals = await repository.fetchMeals();
      status.value = Status.start;
    } catch (e) {
      status.value = Status.error;
    }
  }
}
