import 'package:flutter/material.dart';
import 'package:recipes_app/src/repositories/recipes_repositories.dart';
import '../components/grid_gallery.dart';
import '../models/meal_model.dart';

class MealPage extends StatefulWidget {
  const MealPage({super.key});

  @override
  State<MealPage> createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  late Future<List<Meal>> meals;

  @override
  void initState() {
    super.initState();
    meals = FetchRecipes(null).fetchMeals();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: meals,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridGallery(recipes: snapshot.data as List);
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const CircularProgressIndicator();
        });
  }
}
