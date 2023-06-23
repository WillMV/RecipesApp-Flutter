import 'package:flutter/material.dart';
import 'package:recipes_app/components/card_middle.dart';

class GridGallery extends StatelessWidget {
  const GridGallery({super.key, required this.recipes});
  final List recipes;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: recipes.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (ctx, index) {
          final recipe = recipes[index];
          return CardMiddle(
            srcImg: recipe["img"],
            name: recipe["name"],
          );
        });
  }
}