import 'package:flutter/material.dart';
import '../screens/login_screen.dart';

class AuthenticationLoginButtonWidget extends StatelessWidget {
  AuthenticationLoginButtonWidget({required this.loginScreenState});

  final LoginScreenState loginScreenState;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
        child: ElevatedButton(
            onPressed: () =>
                {loginScreenState.submitForm()}, //() => { print('Login') },
            child: loginScreenState.getFormMode() == FormMode.login
                ? Text('Sign in',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600))
                : Text('Create an account',
                    style: TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.w600))));
  }
}
