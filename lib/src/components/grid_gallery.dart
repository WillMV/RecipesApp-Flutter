import 'package:flutter/material.dart';
import 'package:recipes_app/src/models/recipe_model.dart';
import 'cards/card_small.dart';

class GridGallery extends StatelessWidget {
  const GridGallery({super.key, required this.recipes});
  final List<Recipe> recipes;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: recipes.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (ctx, index) {
          return CardSmall(
            recipe: recipes[index],
          );
        });
  }
}
