import '../widgets/authentication_email_form.dart';
import '../widgets/authentication_password_form.dart';
import '../widgets/authentication_name_form.dart';
import '../widgets/authentication_surname_form.dart';
import '../widgets/authentication_birthdate_form.dart';
import 'package:flutter/material.dart';
import '../screens/login_screen.dart';

class AuthenticationFormWidget extends StatelessWidget {
  AuthenticationFormWidget({Key? key, required this.loginScreenState }): super(key: key);

  final LoginScreenState loginScreenState;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginScreenState.getFormKey(),
      child: loginScreenState.getFormMode() == FormMode.login 
      ? Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.27),
          AuthenticationEmailFormWidget(hintText: 'Email', isPassword: false, loginScreenState: loginScreenState),          
          AuthenticationPasswordFormWidget(hintText: 'Password', isPassword: true, loginScreenState: loginScreenState) 
        ],)
      : Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.13),
          AuthenticationEmailFormWidget(hintText: 'Email', isPassword: false, loginScreenState: loginScreenState),
          AuthenticationNameFormWidget(hintText: 'Name', isPassword: false, loginScreenState: loginScreenState),          
          AuthenticationSurnameFormWidget(hintText: 'Surname', isPassword: false, loginScreenState: loginScreenState),          
          AuthenticationPasswordFormWidget(hintText: 'Password', isPassword: true, loginScreenState: loginScreenState),
          AuthenticationBirthdateFormWidget(hintText: 'Birthday', isPassword: false, loginScreenState: loginScreenState)
        ],)
      );
  }
}