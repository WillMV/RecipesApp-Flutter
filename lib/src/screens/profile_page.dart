import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/src/services/auth_services.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: auth.user!.photoURL != null
                  ? Image.network('${auth.user!.photoURL}')
                  : const Icon(Icons.person, size: 40),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                '${auth.user!.email}',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.check),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Done Recipes'),
              )
            ],
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/favorites');
            },
            child: const Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.favorite),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Favorite Recipes'),
                )
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    showAdaptiveDialog(
                        context: context,
                        builder: (context) => AlertDialog.adaptive(
                              content: const Text(
                                  'Are you sure you want to log out?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    auth.logout();
                                    Navigator.of(context).pushNamed('/auth');
                                  },
                                  child: const Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(Icons.logout),
                                      ),
                                      Text('Logout')
                                    ],
                                  ),
                                )
                              ],
                            ));
                  },
                  child: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.logout),
                      ),
                      Text('Logout')
                    ],
                  ))
            ],
          )
        ],
      )),
    );
  }
}
