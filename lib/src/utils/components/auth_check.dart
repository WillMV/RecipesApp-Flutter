import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/src/screens/home_page.dart';
import 'package:recipes_app/src/screens/login_page.dart';
import 'package:recipes_app/src/services/auth_services.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({super.key});

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of(context);

    loading() {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (auth.isLoading) {
      return loading();
    } else if (auth.user == null) {
      return LoginPage();
    } else {
      return const HomePage();
    } 
  }
}
