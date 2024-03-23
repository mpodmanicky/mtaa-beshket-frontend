import 'package:beshket/features/authentication/widgets/authentication_form.dart';
import 'package:beshket/features/authentication/widgets/authentication_login_button.dart';
import 'package:beshket/features/authentication/widgets/authentication_signup_button.dart';
import 'package:flutter/material.dart';
import 'package:beshket/features/authentication/services/auth_firebase.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({ required this.authentication,  required this.onSignedIn });

  final FireBaseAuth authentication;
  final VoidCallback onSignedIn;

  @override
  State<StatefulWidget> createState() => LoginScreenState();
}

enum FormMode { login, signUp }

class LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  late String _email;
  late String _password;
  late String _error;

  FormMode _formMode = FormMode.login;
  bool _isIos = false;
  bool _isLoading = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beshket')
      ),
      body: Column(
        children: [
          AuthenticationFormWidget(loginScreenState: this),
          AuthenticationLoginButtonWidget(loginScreenState: this),
          AuthenticationLoginButtonWidget(loginScreenState: this),
          AuthenticationSignUpButtonWidget(loginScreenState: this)
        ],
      )
    );
  }

  void showSignUpForm() {
    _formKey.currentState!.reset();
    _error = "";
    setState(() {
      _formMode = FormMode.signUp;
    });
  }

  void showLoginForm() {
    _formKey.currentState!.reset();
    _error = "";
    setState(() {
      _formMode = FormMode.login;
    });
  }

  
  bool saveForm() {
    final form = _formKey.currentState;
    if (form!.validate() ){
      form.save();
      return true;
    }
    return false;
  }

  submitForm() async {
    setState(() {
      _error = "";
      _isLoading = true;
    });
    if( saveForm() ){
      String userId = "";
      if ( _formMode == FormMode.login ){
        userId = widget.authentication.signIn(_email, _password) as String;
      } else {
        userId = widget.authentication.signUp(_email, _password) as String;
      }

      setState(() {
        _isLoading = false;
      });

      if(userId.isNotEmpty) {
        widget.onSignedIn();
      }
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }


  void setEmail(String newEmail){
    _email = newEmail;
  }

  void setPassword(String newPassword){
    _password = newPassword;
  }

  GlobalKey<FormState> getFormKey(){
    return _formKey;
  }

  FormMode getFormMode(){
    return _formMode;
  }

  String getError() {
    return _error;
  }

  bool getIsLoading() {
    return _isLoading;
  }
}