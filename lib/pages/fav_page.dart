import 'package:flutter/material.dart';
import 'package:recipes_app/components/list_gallery.dart';
import 'package:recipes_app/mock.dart';

class FavPage extends StatelessWidget {
  const FavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListGallery(recipes: MEALS),
    );
  }
}
