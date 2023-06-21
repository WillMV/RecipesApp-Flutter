import 'package:flutter/material.dart';
import 'package:hello_world/providers/theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(builder: (context, child) {
      return MaterialApp(
        theme: ThemeProvider.instance.getTheme(),
        title: 'Recipes App',
        home: const HomePage(),
      );
    }, animation: ThemeProvider.instance,);
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(),
      ),
      floatingActionButton: FloatingActionButton(
        child: ThemeProvider.instance.getButtonIcon(),
        onPressed: () {
          ThemeProvider.instance.changeTheme();
        },
      ),
    );
  }
}
