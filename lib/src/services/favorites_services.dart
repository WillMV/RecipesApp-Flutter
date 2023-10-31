import 'package:flutter/material.dart';
import 'package:recipes_app/src/models/recipe_model.dart';
import 'package:recipes_app/src/repositories/favorites_repositories.dart';

class FavoritesServices extends ChangeNotifier {
  final FetchFavorites _repository = FetchFavorites();

  List<Recipe> getFavorites() {
    return _repository.getFavorites();
  }

  void setFavorites(List<Recipe> recipes, Recipe recipe) {
    bool isFavorite = false;
    bool constains = recipes.contains(recipe);
    for (var item in recipes) {
      if (item.id == recipe.id) {
        isFavorite = true;
        recipes.remove(recipe);
      }
    }
    if (!isFavorite) {
      recipes.add(recipe);
    }

    _repository.setFavorites(recipes);
  }
}
