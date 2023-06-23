import 'package:flutter/material.dart';
import 'package:hello_world/components/gallery_bigger.dart';
import 'package:hello_world/mock.dart';

class FavPage extends StatelessWidget {
  const FavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GalleryBigger(recipes: MEALS),
    );
  }
}
