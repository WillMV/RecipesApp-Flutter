import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:recipes_app/src/controllers/constaints.dart';
import 'package:recipes_app/src/controllers/drink_page_controller.dart';
import 'package:recipes_app/src/models/drink_model.dart';
import 'package:recipes_app/src/repositories/recipes_repositories.dart';

import 'drink_page_controller_test.mocks.dart';

@GenerateNiceMocks([MockSpec<FetchRecipes>()])
void main() {
  group('Drink controller', () {
    final repository = MockFetchRecipes();
    final drinkController = DrinkPageController(repository);
    test('Deve preencher a variavel drinks', () async {
      when(repository.fetchDrinks()).thenAnswer((_) async => [
            Drink(
                id: 'id',
                name: 'name',
                category: 'category',
                isAlcoholic: 'isAlcoholic',
                instructions: 'instructions',
                thumb: 'thumb')
          ]);
      expect(drinkController.status, Status.start);
      await drinkController.start();
      expect(drinkController.status, Status.success);
      expect(drinkController.drinks.isNotEmpty, true);
    });
    test('Deve alterar estado para error caso a requisição falhe', () async {
      when(repository.fetchDrinks()).thenThrow(Exception());
      expect(drinkController.status, Status.start);
      await drinkController.start();
      expect(drinkController.status, Status.error);
    });
  });
}
