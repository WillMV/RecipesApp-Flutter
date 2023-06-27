import 'package:flutter/foundation.dart';
import 'package:recipes_app/src/controllers/constaints.dart';
import 'package:recipes_app/src/repositories/recipes_repositories.dart';

import '../models/drink_model.dart';

class DrinkPageController {
  final status = ValueNotifier<Status>(Status.start);
  List<Drink> drinks = [];
  final FetchRecipes _repository;
  DrinkPageController(FetchRecipes? repository)
      : _repository = repository ?? FetchRecipes(null);

  Future start() async {
    try {
      status.value = Status.loading;
      drinks = await _repository.fetchDrinks();
      status.value = Status.success;
    } catch (e) {
      status.value = Status.error;
    }
  }
}
