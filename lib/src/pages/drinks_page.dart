import 'package:flutter/material.dart';
import '../../mock.dart';
import '../components/grid_gallery.dart';

class DrinkPage extends StatelessWidget {
  const DrinkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GridGallery(recipes: DRINKS));
  }
}
