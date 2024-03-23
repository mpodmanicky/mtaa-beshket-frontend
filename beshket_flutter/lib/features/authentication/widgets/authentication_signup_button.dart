import 'package:flutter/material.dart';
import 'package:beshket/features/authentication/screens/login_screen.dart';


class AuthenticationSignUpButtonWidget extends StatelessWidget {
  AuthenticationSignUpButtonWidget({required this.loginScreenState});

  final LoginScreenState loginScreenState;

  @override
  Widget build(BuildContext context){
    return TextButton(
      onPressed: loginScreenState.getFormMode() == FormMode.signUp ? loginScreenState.showLoginForm : loginScreenState.showSignUpForm,
      child: loginScreenState.getFormMode() == FormMode.signUp 
      ? Text('Sing in',
        style: TextStyle( fontSize: 18.0, fontWeight: FontWeight.w300)) 
      : Text('Create an account', 
        style: TextStyle( fontSize: 18.0, fontWeight: FontWeight.w300)),
    );
  }
}