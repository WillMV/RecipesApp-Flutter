import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:recipes_app/src/controllers/constaints.dart';
import 'package:recipes_app/src/controllers/page_controller.dart';
import 'package:recipes_app/src/models/drink_model.dart';
import 'package:recipes_app/src/repositories/recipes_repositories.dart';

import 'drink_page_controller_test.mocks.dart';

@GenerateNiceMocks([MockSpec<FetchRecipes>()])
void main() {
  group('Drink controller', () {
    final repository = MockFetchRecipes();
    final pageController =
        PageControl(typeRecipe: TypeRecipe.drink, repository: repository);
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
      expect(pageController.status.value, Status.start);
      await pageController.start();
      expect(pageController.status.value, Status.success);
      expect(pageController.recipes.isNotEmpty, true);
    });
    test('Deve alterar estado para error caso a requisição falhe', () async {
      when(repository.fetchDrinks()).thenThrow(Exception());
      expect(pageController.status.value, Status.start);
      await pageController.start();
      expect(pageController.status.value, Status.error);
    });
  });
}
