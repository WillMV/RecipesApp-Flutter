import 'package:flutter/foundation.dart';
import 'package:recipes_app/src/constaints/enums.dart';
import 'package:recipes_app/src/models/recipe_model.dart';
import 'package:recipes_app/src/repositories/recipes_repositories.dart';

class MainPageController {
  final status = ValueNotifier(Status.start);
  final FetchRecipes repository;
  final TypeRecipe typeRecipe;
  List<Recipe> recipes = [];

  MainPageController({FetchRecipes? repository, required this.typeRecipe})
      : repository = repository ?? FetchRecipes(null);

  start() async {
    try {
      status.value = Status.loading;
      recipes = typeRecipe == TypeRecipe.drink
          ? await repository.fetchDrinks()
          : await repository.fetchMeals();
      status.value = Status.success;
    } catch (e) {
      status.value = Status.error;
    }
  }
}
