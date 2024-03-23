import 'package:flutter/material.dart';
import 'package:beshket/features/authentication/screens/login_screen.dart';


class AuthenticationErrorWidget extends StatelessWidget {
  AuthenticationErrorWidget({required this.loginScreenState});

  final LoginScreenState loginScreenState;

  Widget build(BuildContext context) {
    if(loginScreenState.getError().isNotEmpty) {
      return Text(
        loginScreenState.getError(),
        style: TextStyle(
          fontSize: 13.0,
          color: Colors.red,
          height: 1.0,
          fontWeight: FontWeight.w300
        )
      );
    } else {
      return Container( height: 0.0, width: 0.0);
    }
  }
}