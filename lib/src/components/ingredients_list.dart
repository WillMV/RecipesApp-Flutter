import 'package:flutter/material.dart';

class IngredientsList extends StatelessWidget {
  final List<String> ingredients;
  final List<String> measures;
  const IngredientsList({
    super.key,
    required this.ingredients,
    required this.measures,
  });

  List<Text> widgetListIngredients() {
    List<Text> texts = [];

    for (var index = 0; index < ingredients.length; index++) {
      texts.add(Text('- ${ingredients[index]} ${measures[index]}'));
    }

    return texts;
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
