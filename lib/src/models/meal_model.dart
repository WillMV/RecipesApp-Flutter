import 'package:recipes_app/src/models/recipe_model.dart';

class Meal implements Recipe {
  @override
  String id;
  @override
  String name;
  @override
  String category;
  @override
  String instructions;
  @override
  String thumb;
  @override
  List<String> ingredients;
  @override
  List<String> measures;

  final String area;
  //final String tags;

  Meal({
    required this.id,
    required this.name,
    required this.category,
    required this.area,
    required this.instructions,
    required this.thumb,
    required this.ingredients,
    required this.measures,
    // required this.tags,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json["idMeal"],
      name: json["strMeal"],
      category: json["strCategory"],
      area: json["strArea"],
      instructions: json["strInstructions"],
      thumb: json["strMealThumb"],
      ingredients: json["listIngredients"],
      measures: json["listMeasures"],
      // tags: json["strTags"],
    );
  }
}
