import 'package:flutter/material.dart';
import 'package:recipes_app/src/controllers/constaints_controller.dart';
import '../controllers/main_page_controller.dart';
import '../models/drink_model.dart';
import '../components/grid_gallery.dart';

class DrinkPage extends StatefulWidget {
  const DrinkPage({super.key});

  @override
  State<DrinkPage> createState() => _DrinkPageState();
}

class _DrinkPageState extends State<DrinkPage> {
  late Future<List<Drink>> drinks;
  final controller = MainPageController(typeRecipe: TypeRecipe.drink);

  Widget _start() {
    return Container();
  }

  Widget _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _error() {
    return const Text('Falhou ;-;');
  }

  Widget _success() {
    return GridGallery(recipes: controller.recipes);
  }

  Widget stateManagement(Status status) {
    switch (status) {
      case Status.start:
        return _start();
      case Status.loading:
        return _loading();
      case Status.error:
        return _error();
      case Status.success:
        return _success();
      default:
        return _start();
    }
  }

  @override
  void initState() {
    super.initState();
    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller.status,
        builder: (ctx, child) {
          return stateManagement(controller.status.value);
        });
  }
}
