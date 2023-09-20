import 'package:flutter/material.dart';
import 'package:recipes_app/src/utils/components/buttons/fav_button.dart';
import 'package:recipes_app/src/controllers/detail_page_controller.dart';
import 'package:recipes_app/src/controllers/fav_controller.dart';
import 'package:recipes_app/src/models/drink_model.dart';
import 'package:recipes_app/src/models/meal_model.dart';
import 'package:recipes_app/src/models/recipe_model.dart';

class CardSmall extends StatefulWidget {
  const CardSmall({super.key, required this.recipe});
  final Recipe recipe;

  @override
  State<CardSmall> createState() => _CardSmallState();
}

class _CardSmallState extends State<CardSmall> {
  final detailController = DetailPageController.instance;
  late FavController favController;

  @override
  void initState() {
    super.initState();
    favController = FavController(widget.recipe);
    favController.isFavVerify();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Colors.blue,
        onTap: () {
          if (widget.recipe.toString() == "Instance of 'Drink'") {
            detailController.drink = widget.recipe as Drink;
            Navigator.pushNamed(context, '/detail/drink');
          } else {
            detailController.meal = widget.recipe as Meal;
            Navigator.pushNamed(context, '/detail/meal');
          }
        },
        child: Stack(
          children: [
            Image.network(
              widget.recipe.thumb,
              // fit: BoxFit.contain,
            ),
            Center(
              child: Text(
                widget.recipe.name,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    shadows: [
                      Shadow(blurRadius: 10),
                      BoxShadow(
                          blurRadius: 5,
                          blurStyle: BlurStyle.outer,
                          spreadRadius: 1)
                    ]),
              ),
            ),
            FavButton(favController: favController)
          ],
        ),
      ),
    );
  }
}
