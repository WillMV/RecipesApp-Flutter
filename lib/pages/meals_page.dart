import 'package:flutter/material.dart';
import 'package:hello_world/components/gallery_middle.dart';
import '../mock.dart';

class MealPage extends StatelessWidget {
  const MealPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GalleryMiddle(recipes: MEALS));
  }
}
