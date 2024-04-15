import 'package:flutter/material.dart';
import '../screens/login_screen.dart';


class AuthenticationErrorWidget extends StatelessWidget {
  AuthenticationErrorWidget({required this.loginScreenState});

  final LoginScreenState loginScreenState;

  @override
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
      return SizedBox( height: 0.0, width: 0.0);
    }
  }
}