import 'package:flutter/material.dart';
import 'package:recipes_app/src/controllers/theme_controller.dart';
import 'package:recipes_app/src/pages/drink_details_page.dart';
// import 'package:recipes_app/src/pages/meals_details.dart';
import 'src/pages/home_page.dart';

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
            // '/detail/meal':(context) => const /MealDetailPage(),
          },
          initialRoute: '/home',
        );
      },
    );
  }
}

