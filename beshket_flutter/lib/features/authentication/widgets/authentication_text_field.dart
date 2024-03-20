import 'package:beshket/global_variables/authenticaton/authenticaton_text_field.dart';
import 'package:flutter/material.dart';

class AuthenticationTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  const AuthenticationTextField({Key? key, required this.controller, required this.hintText, required this.isPassword}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox( 
      width: MediaQuery.of(context).size.width * 0.85,
      child: TextFormField(
                controller: controller,
                obscureText: isPassword,
                decoration: InputDecoration(
                  hintText: hintText,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AuthenticationTextFieldStyle.borderColor,
                    )
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AuthenticationTextFieldStyle.borderColorEnabled,
                    )
                  )
                ),
                validator: (val) {

                },
              )
      );
  }
}