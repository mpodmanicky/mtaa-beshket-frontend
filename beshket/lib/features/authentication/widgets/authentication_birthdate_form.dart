import 'package:flutter/material.dart';
import 'package:beshket/features/authentication/screens/login_screen.dart';


class AuthenticationBirthdateFormWidget extends StatelessWidget {
  AuthenticationBirthdateFormWidget({Key? key,  required this.hintText, required this.isPassword, required this.loginScreenState }): super(key: key);

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
        keyboardType: TextInputType.datetime,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hintText
        ),
        validator: (value) =>  value!.isEmpty ? 'This field can\'t be emtpy' : null,
        //onSaved: (value) => loginScreenState.setPassword(value!.trim()),  
      )
      );
  }
}