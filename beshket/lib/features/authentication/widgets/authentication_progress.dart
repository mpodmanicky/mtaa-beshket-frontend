import 'package:flutter/material.dart';
import '../screens/login_screen.dart';


class AuthenticationProgressingWidget extends StatelessWidget {
  AuthenticationProgressingWidget({required this.loginScreenState});

  final LoginScreenState loginScreenState;

  @override
  Widget build(BuildContext context) {
    if ( loginScreenState.getIsLoading() ){
      return Center(child: CircularProgressIndicator());
    } else {
      return SizedBox(height: 0.0, width: 0.0);
    }
  }
}