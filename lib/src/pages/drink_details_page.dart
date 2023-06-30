import 'package:flutter/material.dart';
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
          const IngredientsList(),
          Column(children: [
            const ListTile(
              title: Text('Instructions',
              style:
                  TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
              elevation: 0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                side: BorderSide(
                  color: Colors.grey
                )
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(recipe!.instructions)
              ),
                      ),
            ),
          ],)
        ],
      ),
    );
  }
}


