import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/src/services/auth_services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  late bool isLogin;
  late String titulo;
  late String actionButton;
  late String toggleButton;

  bool showPassword = false;

  @override
  void initState() {
    super.initState();
    setFormAction(true);
  }

  setFormAction(bool login) {
    setState(() {
      isLogin = login;
      if (isLogin) {
        titulo = 'Wellcome';
        actionButton = 'Login';
        toggleButton = "Don't have an account yet? Sign up now";
      } else {
        titulo = 'Create your account';
        actionButton = 'Register';
        toggleButton = 'Back to login.';
      }
    });
  }

  login() async {
    try {
      await context.read<AuthService>().login(email.text, password.text);
    } on AuthExecption catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  register() async {
    try {
      await context.read<AuthService>().register(email.text, password.text);
    } on AuthExecption catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 48.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  titulo,
                  style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1.5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: TextFormField(
                    controller: email,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the Email correctly.';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: TextFormField(
                    controller: password,
                    obscureText: !showPassword,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Password'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the password correctly.';
                      } else if (value.length < 6) {
                        return 'Your password must contain at least 6 digits.';
                      }
                      return null;
                    },
                  ),
                ),
                Row(

                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Checkbox.adaptive(
                          value: showPassword,
                          onChanged: (value) {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          }),
                    ),
                        Text('Show password')
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        if (isLogin) {
                          login();
                        } else {
                          register();
                        }
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.check),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            actionButton,
                            style: const TextStyle(fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () => setFormAction(!isLogin),
                    child: Text(toggleButton))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
