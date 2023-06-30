import 'package:flutter/material.dart';

class IngredientsList extends StatelessWidget {
  final List<String> ingredients;
  const IngredientsList({
    super.key,
    required this.ingredients,
  });

  List<Text> widgetListIngredients() {
    return ingredients
        .map((ingredient) => Text('- $ingredient'))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ListTile(
          title: Text('Ingredients',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
              elevation: 0,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  side: BorderSide(color: Colors.grey)),
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListBody(
                    children: widgetListIngredients(),
                  ))),
        ),
      ],
    );
  }
}
