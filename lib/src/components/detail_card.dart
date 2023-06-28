import 'package:flutter/material.dart';

import '../models/drink_model.dart';

class DetailCard extends StatelessWidget {
  const DetailCard({
    super.key,
    required this.recipe,
  });

  final Drink? recipe;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Flexible(
          child: Image.network(
        recipe!.thumb,
        height: 250,
        width: double.infinity,
        fit: BoxFit.cover,
      )),
      SizedBox(
        height: 250,
        child: Center(
            child: Text(
          recipe!.name,
          style: const TextStyle(color: Colors.white, fontSize: 50, shadows: [Shadow(blurRadius: 50)]),
        )),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const BackButton(color: Colors.amber,),
                const Icon(Icons.wine_bar,
                    color: Colors.amber,
                    shadows: [Shadow(blurRadius: 10)]),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  recipe!.category,
                  style: const TextStyle(
                      color: Colors.amber,
                      fontSize: 20,
                      shadows: [Shadow(blurRadius: 10)]),
                ),
              ],
            ),
            const Row(
              children: [
                Icon(Icons.share,
                    color: Colors.amber,
                    shadows: [Shadow(blurRadius: 10)]),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.favorite_border,
                    color: Colors.amber, shadows: [Shadow(blurRadius: 10)])
              ],
            ),
          ],
        ),
      )
    ]);
  }
}
