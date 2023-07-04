import 'package:flutter/material.dart';
import 'package:recipes_app/src/controllers/fav_controller.dart';
import 'package:recipes_app/src/models/recipe_model.dart';
import '../buttons/fav_button.dart';

class DetailCard extends StatefulWidget {
  const DetailCard({
    super.key,
    required this.recipe,
  });

  final Recipe? recipe;

  @override
  State<DetailCard> createState() => _DetailCardState();
}

class _DetailCardState extends State<DetailCard> {
  late FavController favController;

  @override
  void initState() {
    super.initState();
    favController = FavController(widget.recipe as Recipe);
    favController.isFavVerify();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Flexible(
          child: Image.network(
        widget.recipe!.thumb,
        height: 250,
        width: double.infinity,
        fit: BoxFit.cover,
      )),
      SizedBox(
        height: 250,
        child: Center(
            child: Text(
          widget.recipe!.name,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 50,
              shadows: [Shadow(blurRadius: 50)]),
        )),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const BackButton(
                  color: Colors.amber,
                ),
                const Icon(Icons.wine_bar,
                    color: Colors.amber, shadows: [Shadow(blurRadius: 10)]),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  widget.recipe!.category,
                  style: const TextStyle(
                      color: Colors.amber,
                      fontSize: 20,
                      shadows: [Shadow(blurRadius: 10)]),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.share,
                    color: Colors.amber, shadows: [Shadow(blurRadius: 10)]),
                const SizedBox(
                  width: 10,
                ),
                FavButton(favController: favController)
              ],
            ),
          ],
        ),
      )
    ]);
  }
}
