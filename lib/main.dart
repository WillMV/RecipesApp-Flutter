// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:recipes_app/src/components/card_bigger.dart';
import 'package:recipes_app/src/components/card_middle.dart';
import 'package:recipes_app/src/pages/drinks_page.dart';
import 'package:recipes_app/src/pages/fav_page.dart';
import 'package:recipes_app/src/pages/meals_page.dart';
import 'package:recipes_app/src/controllers/theme_controller.dart';
// import '../test/src/repositories/mock.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeProvider.instance.getTheme(),
          title: 'Recipes App',
          home: const HomePage(),
        );
      },
      animation: ThemeProvider.instance,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // const srcImg = 'https://a.cdn-hotels.com/gdcs/production42/d1958/7cc955d5-867f-4f7f-980b-3f8c95c3933f.jpg?impolicy=fcrop&w=800&h=533&q=medium';
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
                bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.local_dining)),
                Tab(icon: Icon(Icons.liquor)),
                Tab(
                  icon: Icon(Icons.favorite),
                )
              ],
            )),
            body: const TabBarView(children: [
              MealPage(),
              DrinkPage(),
              DrinkPage(),
              // FavPage(),
            ]),
            floatingActionButton: AnimatedBuilder(
              animation: ThemeProvider.instance,
              builder: (ctx, child) {
                return FloatingActionButton(
                  child: ThemeProvider.instance.getButtonIcon(),
                  onPressed: () {
                    ThemeProvider.instance.changeTheme();
                  },
                );
              },
            )));
  }
}
