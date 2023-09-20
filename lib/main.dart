import 'package:flutter/material.dart';
import 'package:recipes_app/src/controllers/theme_controller.dart';
import 'package:recipes_app/src/screens/drink_details_page.dart';
import 'package:recipes_app/src/screens/fav_page.dart';
import 'package:recipes_app/src/screens/meal_details_page.dart';
import 'package:recipes_app/src/screens/profile_page.dart';
import 'src/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ThemeProvider.instance,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeProvider.instance.getTheme(),
          title: 'Recipes App',
          routes: {
            '/home': (context) => const HomePage(),
            '/detail/drink':(context) => const DrinkDetailPage(),
            '/detail/meal':(context) => const MealDetailPage(),
            '/favs':(context) => const FavPage(),
            '/profile':(context) => const ProfilePage(),
          },
          initialRoute: '/home',
        );
      },
    );
  }
}

