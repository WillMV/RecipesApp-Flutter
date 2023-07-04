import 'package:flutter/material.dart';
import '../controllers/fav_controller.dart';

class FavButton extends StatelessWidget {
  const FavButton({
    super.key,
    required this.favController,
  });

  final FavController favController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: favController,
        builder: (context, child) {
          return favController.getButtonIcon();
        });
  }
}