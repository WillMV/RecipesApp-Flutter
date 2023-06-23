import 'package:flutter/material.dart';
import 'package:recipes_app/components/card_bigger.dart';

class ListGallery extends StatelessWidget {
  const ListGallery({super.key, required this.recipes});
  final List recipes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (ctx, index) {
          final recipe = recipes[index];
          return CardBigger(
            srcImg: recipe["img"],
            name: recipe["name"],
          );
        });
  }
}
