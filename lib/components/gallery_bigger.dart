import 'package:flutter/material.dart';
import 'package:hello_world/components/card_bigger.dart';

class GalleryBigger extends StatelessWidget {
  const GalleryBigger({super.key, required this.recipes});
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
