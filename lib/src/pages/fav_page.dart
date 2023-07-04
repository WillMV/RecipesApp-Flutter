import 'package:flutter/material.dart';
import 'package:recipes_app/src/controllers/fav_controller.dart';
import 'package:recipes_app/src/models/recipe_model.dart';
import '../components/list_gallery.dart';

class FavPage extends StatefulWidget {
  const FavPage({super.key});

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  late List<Recipe> recipes;

  @override
  void initState() {
    super.initState();
    recipes = FavController.recipesFavs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListGallery(recipes: recipes ),
    );
  }
}
