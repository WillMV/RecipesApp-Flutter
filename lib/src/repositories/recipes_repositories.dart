// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:recipes_app/src/models/drink_model.dart';
import 'package:recipes_app/src/models/meal_model.dart';

import 'constaints.dart';

// https://www.themealdb.com/api/json/v1/1/search.php?s=
// https://www.thecocktaildb.com/api/json/v1/1/search.php?s=
class FetchRecipes {
  final Dio _client;

  FetchRecipes(Dio? client) : _client = client ?? Dio();

  void resValidate(int? statusCode) {
    if (statusCode != 200) throw Exception('Requisição falhou $statusCode.');
  }

  Map<String, dynamic> getterIngredients(Map<String, dynamic> json) {
    List<String> ingredients = [];
    int i = 1;
    String key = 'strIngredient$i';

    while (json['strIngredient$i'] != null && json['strIngredient$i'] != "") {
      ingredients.add(json[key]);
      i++;
      key = 'strIngredient$i';
    }

    json["listIngredients"] = ingredients;
    return json;
  }

  Future<List<Drink>> fetchDrinks() async {
    final response = await _client.get(drinkUrl);

    resValidate(response.statusCode);

    final jsonList = response.data["drinks"] as List;
    return jsonList.map((json) {
      Map<String, dynamic> jsonWithIngredientsList = getterIngredients(json);
      return Drink.fromJson(jsonWithIngredientsList);
    }).toList();
  }

  Future<List<Meal>> fetchMeals() async {
    final response = await _client.get(mealUrl);

    resValidate(response.statusCode);

    final jsonList = response.data["meals"] as List;
    return jsonList.map((json) {
      Map<String, dynamic> jsonWithIngredientsList = getterIngredients(json);
      return Meal.fromJson(jsonWithIngredientsList);
    }).toList();
  }
}
