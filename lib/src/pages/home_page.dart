import 'package:flutter/material.dart';
import '../controllers/theme_controller.dart';
import 'drinks_page.dart';
import 'fav_page.dart';
import 'meals_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
                title: const Text('RecipesApp'),
                leading: Image.asset('assets/iconRecipesapp.png'),
            ),
            body: const TabBarView(children: [
              MealPage(),
              DrinkPage(),
              FavPage(),
            ]),
            bottomNavigationBar: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.local_dining)),
                Tab(icon: Icon(Icons.liquor)),
                Tab(
                  icon: Icon(Icons.favorite),
                )
              ],
            ),
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
