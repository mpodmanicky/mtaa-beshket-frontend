import 'package:beshket/features/authentication/screens/log_in_screen.dart';
import 'package:beshket/features/authentication/screens/register_screen.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLogin = true;

  //toggle
  void togglePages() {
    setState(() {
      print('Toggling pages.');
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return LoginForm(onTap: togglePages);
    } else {
      return RegisterPage(onTap: togglePages);
    }
  }
}
