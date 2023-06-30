import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:recipes_app/src/models/drink_model.dart';
import 'package:recipes_app/src/models/meal_model.dart';
import 'package:recipes_app/src/repositories/constaints.dart';
import 'package:recipes_app/src/repositories/recipes_repositories.dart';
import 'mock.dart';
import 'repositories_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Dio>()])
void main() {
  group('FecthRepository Test', () {
    FetchRecipes repository;
    final client = MockDio();
    repository = FetchRecipes(client);

    test("First test", () {
      expect(repository, isInstanceOf<FetchRecipes>());
    });

    test('Deve trazer uma instancia de Drink', () async {
      when(client.get(drinkUrl)).thenAnswer((_) async => Response(
            data: drinks,
            statusCode: 200,
            requestOptions: RequestOptions(),
          ));
      final data = await repository.fetchDrinks();
      expect(data, isInstanceOf<List<String>>());
    });
        test('Deve trazer uma instancia de Meal', () async {
      when(client.get(mealUrl)).thenAnswer((_) async => Response(
            data: meals,
            statusCode: 200,
            requestOptions: RequestOptions(),
            statusMessage: '200',
          ));
      final data = await repository.fetchMeals();
      expect(data, isInstanceOf<List<Meal>>());
    });
  });
}
