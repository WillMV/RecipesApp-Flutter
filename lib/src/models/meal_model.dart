class Meal {
  String id;
  String name;
  String category;
  String area;
  String instructions;
  String thumb;
  // String tags;

  Meal({
    required this.id,
    required this.name,
    required this.category,
    required this.area,
    required this.instructions,
    required this.thumb,
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
      // tags: json["strTags"],
    );
  }
}
