import 'package:flutter/material.dart';

class IngredientsList extends StatelessWidget {
  const IngredientsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ListTile(
          title: Text('Ingredients',
              style:
                  TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              side: BorderSide(
                color: Colors.grey
              )
            ),
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
        ),
      ],
    );
  }
}