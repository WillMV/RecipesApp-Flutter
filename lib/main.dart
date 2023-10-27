import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/firebase_options.dart';
import 'package:recipes_app/src/controllers/theme_controller.dart';
import 'package:recipes_app/src/screens/drink_details_page.dart';
import 'package:recipes_app/src/screens/fav_page.dart';
import 'package:recipes_app/src/screens/meal_details_page.dart';
import 'package:recipes_app/src/screens/profile_page.dart';
import 'package:recipes_app/src/services/auth_services.dart';
import 'package:recipes_app/src/utils/components/auth_check.dart';
import 'src/screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
   ChangeNotifierProvider(create: (context) => AuthService(),
   child: const MyApp())
   );
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
            '/auth': (context) => const AuthCheck(),
            '/home': (context) => const HomePage(),
            '/detail/drink': (context) => const DrinkDetailPage(),
            '/detail/meal': (context) => const MealDetailPage(),
            '/favs': (context) => const FavPage(),
            '/profile': (context) => const ProfilePage(),
          },
          initialRoute: '/auth',
        );
      },
    );
  }
}
