import 'package:flutter/material.dart';
import 'package:recipes_app/src/models/meal_model.dart';
import '../utils/components/cards/instructions_card.dart';
import '../controllers/detail_page_controller.dart';
import '../utils/components/cards/detail_card.dart';
import '../utils/components/ingredients_list.dart';

class MealDetailPage extends StatefulWidget {
  const MealDetailPage({super.key});

  @override
  State<MealDetailPage> createState() => _MealDetailPageState();
}

class _MealDetailPageState extends State<MealDetailPage> {
  late Meal? recipe;
  @override
  void initState() {
    super.initState();
    recipe = DetailPageController.instance.meal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          DetailCard(recipe: recipe),
          IngredientsList( ingredients: recipe!.ingredients, measures: recipe!.measures,),
          InstructionsCard(recipe: recipe)
        ],
      ),
    );
  }
}
