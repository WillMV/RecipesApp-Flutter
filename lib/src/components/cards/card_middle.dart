import 'package:flutter/material.dart';
import 'package:recipes_app/src/controllers/detail_page_controller.dart';
import 'package:recipes_app/src/models/drink_model.dart';
import 'package:recipes_app/src/models/meal_model.dart';
import 'package:recipes_app/src/models/recipe_model.dart';

class CardMiddle extends StatelessWidget {
  CardMiddle({super.key, required this.recipe});
  final Recipe recipe;
  final detailController = DetailPageController.instance;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Colors.blue,
        onTap: () {
          if (recipe.toString() == "Instance of 'Drink'") {
            detailController.drink = recipe as Drink;
            Navigator.pushNamed(context, '/detail/drink');
          } else {
            detailController.meal = recipe as Meal;
            Navigator.pushNamed(context, '/detail/meal');
          }
        },
        child: Column(
          children: [
            Image.network(recipe.thumb,
                height: 150, width: 200, fit: BoxFit.cover),
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
