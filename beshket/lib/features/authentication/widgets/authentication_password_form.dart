import 'package:flutter/material.dart';
import '../screens/login_screen.dart';


class AuthenticationPasswordFormWidget extends StatelessWidget {
  AuthenticationPasswordFormWidget({Key? key,  required this.hintText, required this.isPassword, required this.loginScreenState }): super(key: key);

  final String hintText;
  final bool isPassword;

  final LoginScreenState loginScreenState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        autofocus: false,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hintText
        ),
        validator: (value) =>  value!.isEmpty ? 'Password can\'t be empty' : null,
        onSaved: (value) => loginScreenState.setPassword(value!.trim()),  
      )
      );
  }
}