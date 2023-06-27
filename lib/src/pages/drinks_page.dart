import 'package:flutter/material.dart';
import '../models/drink_model.dart';
import '../components/grid_gallery.dart';
import '../repositories/recipes_repositories.dart';

class DrinkPage extends StatefulWidget {
  const DrinkPage({super.key});

  @override
  State<DrinkPage> createState() => _DrinkPageState();
}

class _DrinkPageState extends State<DrinkPage> {
  late Future<List<Drink>> drinks;

  @override
  void initState() {
    super.initState();
    drinks = FetchRecipes(null).fetchDrinks();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: drinks,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridGallery(recipes: snapshot.data as List<Drink>);
        }
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
