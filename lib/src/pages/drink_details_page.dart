import 'package:flutter/material.dart';
import '../components/instructions_card.dart';
import '../controllers/detail_page_controller.dart';
import '../components/detail_card.dart';
import '../components/ingredients_list.dart';
import '../models/drink_model.dart';

class DrinkDetailPage extends StatefulWidget {
  const DrinkDetailPage({super.key});

  @override
  State<DrinkDetailPage> createState() => _DrinkDetailPageState();
}

class _DrinkDetailPageState extends State<DrinkDetailPage> {
  late Drink? recipe;
  @override
  void initState() {
    super.initState();
    recipe = DetailPageController.instance.drink;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          DetailCard(recipe: recipe),
          IngredientsList( ingredients: recipe!.ingredients),
          InstructionsCard(recipe: recipe)
        ],
      ),
    );
  }
}
