import 'package:flutter/material.dart';
import 'package:beshket/features/authentication/screens/login_screen.dart';


class AuthenticationNameFormWidget extends StatelessWidget {
  AuthenticationNameFormWidget({Key? key, required this.hintText, required this.isPassword, required this.loginScreenState }): super(key: key);
  
  final String hintText;
  final bool isPassword;

  final LoginScreenState loginScreenState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.name,
        autofocus: false,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hintText
        ),
        validator: (value) =>  value!.isEmpty ? 'Not a valid name' : null,
        //onSaved: (value) => loginScreenState.setEmail(value!.trim()),  
      )
    );
  }
}