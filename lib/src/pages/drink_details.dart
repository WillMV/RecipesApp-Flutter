import 'package:flutter/material.dart';
import 'package:recipes_app/src/controllers/detail_page_controller.dart';

import '../components/detail_card.dart';
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
        // O ListView deixa visivel a parte superior
        children: [
          DetailCard(recipe: recipe),
          const Column(
            children: [
              ListTile(
                leading: Text('Ingredients',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ListBody(
                    children: [
                      Text('- data de conteudo'),
                      Text('- data de content'),
                      Text('- data de nada'),
                      Text('- data de dat'),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
