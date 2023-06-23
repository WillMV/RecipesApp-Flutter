import 'package:flutter/material.dart';
import 'package:hello_world/components/gallery_middle.dart';
import '../mock.dart';

class DrinkPage extends StatelessWidget {
  const DrinkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GalleryMiddle(recipes: DRINKS));
  }
}
