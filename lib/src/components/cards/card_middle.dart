import 'package:flutter/material.dart';
import 'package:recipes_app/src/components/buttons/fav_button.dart';
import 'package:recipes_app/src/controllers/fav_controller.dart';
import 'package:recipes_app/src/controllers/detail_page_controller.dart';
import '../../models/drink_model.dart';
import '../../models/meal_model.dart';
import '../../models/recipe_model.dart';

class CardMiddle extends StatefulWidget {
  const CardMiddle({super.key, required this.recipe});
  final Recipe recipe;

  @override
  State<CardMiddle> createState() => _CardMiddleState();
}

class _CardMiddleState extends State<CardMiddle> {
  late FavController favController;
  final detailController = DetailPageController.instance;

  @override
  void initState() {
    super.initState();
    favController = FavController(widget.recipe);
    favController.isFavVerify();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.recipe.thumb,
              width: 130,
            ),
            Expanded(
              child: Column(
                children: [
                  ListTile(
                    title: Text(widget.recipe.name),
                    subtitle: Text(widget.recipe.category),
                  ),
                  ListBody(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(Icons.share),
                          FavButton(favController: favController)
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
