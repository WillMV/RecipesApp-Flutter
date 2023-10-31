import 'package:firebase_database/firebase_database.dart';
import 'package:recipes_app/src/models/recipe_model.dart';
import 'package:recipes_app/src/services/auth_services.dart';

class FetchFavorites {
  late final DatabaseReference _ref;
  late final String _userId;

  FetchFavorites() {
    getUser();
    _ref = FirebaseDatabase.instance.ref('users/$_userId/favorites');
  }

  void getUser() {
    AuthService auth = AuthService();
    _userId = auth.user!.uid;
  }

  List<Recipe> getFavorites() {
    late final dynamic data;

    _ref.onValue.listen((event) {
      data = event.snapshot.value;
    });

    data as List;

    return data;
  }

  void setFavorites(List<Recipe> recipe) async {
    await _ref.set(recipe);
  }
}
