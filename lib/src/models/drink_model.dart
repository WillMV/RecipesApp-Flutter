import 'package:recipes_app/src/models/recipe_model.dart';

class Drink implements Recipe {
  @override
  String id;
  @override
  String name;
  @override
  String category;
  String isAlcoholic;
  @override
  String instructions;
  @override
  String thumb;
  // final String ingredients;

  Drink({
    required this.id,
    required this.name,
    required this.category,
    required this.isAlcoholic,
    required this.instructions,
    required this.thumb,
    // required this.ingredients,
  });

  factory Drink.fromJson(Map<String, dynamic> json) {
    return Drink(
      id: json["idDrink"],
      name: json["strDrink"],
      category: json["strCategory"],
      isAlcoholic: json["strAlcoholic"],
      instructions: json["strInstructions"],
      thumb: json["strDrinkThumb"],
      // ingredients: json["strIngredients"],
    );
  }
}
