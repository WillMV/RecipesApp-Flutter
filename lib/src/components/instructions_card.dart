import 'package:flutter/material.dart';

import '../models/drink_model.dart';

class InstructionsCard extends StatelessWidget {
  const InstructionsCard({
    super.key,
    required this.recipe,
  });

  final Drink? recipe;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const ListTile(
        title: Text('Instructions',
        style:
            TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
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
        ),
    ],);
  }
}
