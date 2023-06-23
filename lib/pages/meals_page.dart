import 'package:flutter/material.dart';
import 'package:recipes_app/components/grid_gallery.dart';
import '../mock.dart';

class MealPage extends StatelessWidget {
  const MealPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GridGallery(recipes: MEALS));
  }
}
