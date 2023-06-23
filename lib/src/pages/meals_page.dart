import 'package:flutter/material.dart';
import '../../mock.dart';
import '../components/grid_gallery.dart';

class MealPage extends StatelessWidget {
  const MealPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GridGallery(recipes: MEALS));
  }
}
