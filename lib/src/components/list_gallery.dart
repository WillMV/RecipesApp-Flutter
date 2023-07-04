import 'package:flutter/material.dart';
import 'package:recipes_app/src/models/recipe_model.dart';
import '../components/card_bigger.dart';

class ListGallery extends StatelessWidget {
  const ListGallery({super.key, required this.recipes});
  final List<Recipe> recipes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (ctx, index) {
          return CardBigger(
            recipe: recipes[index],
          );
        });
  }
}
