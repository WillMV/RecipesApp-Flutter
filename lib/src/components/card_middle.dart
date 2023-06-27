import 'package:flutter/material.dart';
import 'package:recipes_app/src/models/recipe_model.dart';

class CardMiddle extends StatelessWidget {
  const CardMiddle({super.key, required this.recipe});
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Colors.blue,
        onTap: () {
          debugPrint('Card tapped');
        },
        child: Column(
          children: [
            Image.network(recipe.thumb, height: 150, width: 200, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                      child: Title(
                    color: Colors.black,
                    child: Text(
                      recipe.name,
                      style: const TextStyle(fontSize: 20),
                    ),
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
