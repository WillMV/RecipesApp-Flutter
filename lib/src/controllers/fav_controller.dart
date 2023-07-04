import 'package:flutter/material.dart';
import 'package:recipes_app/src/models/recipe_model.dart';

class FavController extends ChangeNotifier {
  static List<Recipe> recipesFavs = [];

  final Recipe recipe;
  bool isFav = false;
  FavController(this.recipe);

  void setFav() {
    if (isFav) {
      isFav = false;
      recipesFavs.remove(recipe);
    } else {
      isFav = true;
      recipesFavs.add(recipe);
    }
    notifyListeners();
  }

  void isFavVerify() {
    for (var recipeFav in recipesFavs) {
      if (recipeFav.id == recipe.id) {
        isFav = true;
        return;
      }
    }
  }

  Widget getButtonIcon() {
    return isFav
        ? IconButton(
            icon: const Icon(
              Icons.favorite,
              color: Colors.amber,
              shadows: [Shadow(blurRadius: 5)],
            ),
            onPressed: () => setFav(),
          )
        : IconButton(
            icon: const Icon(
              Icons.favorite_border_outlined,
              color: Colors.amber,
              shadows: [Shadow(blurRadius: 5)],
            ),
            onPressed: () => setFav(),
          );
  }
}
