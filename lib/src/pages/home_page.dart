import 'package:flutter/material.dart';
import '../controllers/theme_controller.dart';
import 'drinks_page.dart';
import 'fav_page.dart';
import 'meals_page.dart';

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
              FavPage(),
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
