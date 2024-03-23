import 'package:flutter/material.dart';
import 'package:beshket/features/authentication/screens/login_screen.dart';


class AuthenticationLoginButtonWidget extends StatelessWidget {
  AuthenticationLoginButtonWidget({required this.loginScreenState});

  final LoginScreenState loginScreenState;

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
      child: MaterialButton(
        elevation: 5.0,
        minWidth: 200.0,
        height: 42.0,
        color: Colors.blue,
        onPressed: () => { print('Login') }, //loginScreenState.submitForm(),
        child: 
          loginScreenState.getFormMode() == FormMode.login 
            ? Text('Create an Account',
              style: TextStyle( fontSize: 18.0, fontWeight: FontWeight.w300))
            : Text('Sing in', 
              style: TextStyle( fontSize: 18.0, fontWeight: FontWeight.w300))
        )
    );
  }
}