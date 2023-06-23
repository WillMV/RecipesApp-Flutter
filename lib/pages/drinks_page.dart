import 'package:flutter/material.dart';
import 'package:recipes_app/components/grid_gallery.dart';
import '../mock.dart';

class DrinkPage extends StatelessWidget {
  const DrinkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GridGallery(recipes: DRINKS));
  }
}
