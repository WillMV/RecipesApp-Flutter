import 'package:flutter/material.dart';
import 'package:recipes_app/src/utils/components/grid_gallery.dart';
import '../controllers/constaints.dart';
import '../controllers/main_page_controller.dart';

class MealPage extends StatefulWidget {
  const MealPage({super.key});

  @override
  State<MealPage> createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  final controller = MainPageController(typeRecipe: TypeRecipe.meal);

  _start() {
    return Container();
  }

  _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  _error() {
    return const Text('Error ;=;');
  }

  _success() {
    return  GridGallery(recipes: controller.recipes);

  }

  stateManagement(Status status) {
    switch (status) {
      case Status.loading:
        return _loading();

      case Status.error:
        return _error();

      case Status.success:
        return _success();
      case Status.start:
        _start();
      default:
        _start();
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
