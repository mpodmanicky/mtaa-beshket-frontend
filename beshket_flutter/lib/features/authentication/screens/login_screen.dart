import 'package:beshket/features/authentication/widgets/authentication_error.dart';
import 'package:beshket/features/authentication/widgets/authentication_form.dart';
import 'package:beshket/features/authentication/widgets/authentication_login_button.dart';
import 'package:beshket/features/authentication/widgets/authentication_progress.dart';
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

  String _email= "";
  String _password = "";
  String _error = "";

  FormMode _formMode = FormMode.login;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(
          child: Text('Beshket')
          )
      ),
      body: Column(
          children: [
            AuthenticationFormWidget(loginScreenState: this),
            AuthenticationLoginButtonWidget(loginScreenState: this),
            AuthenticationSignUpButtonWidget(loginScreenState: this),
            AuthenticationErrorWidget(loginScreenState: this),
            AuthenticationProgressingWidget(loginScreenState: this)
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
    if( saveForm()){
        String userId;
        try {
        if ( _formMode == FormMode.login ){
          userId = await widget.authentication.signIn(_email, _password);
          print(userId);
        } else {
          userId = await widget.authentication.signUp(_email, _password);
        }

        setState(() {
          _isLoading = false;
        });

        if(userId.toString().isNotEmpty) {
          widget.onSignedIn();
        }
      } catch (e) {
        setState(() {
          _isLoading = false;
          _error = 'Incorrect email or password';
         });
       }
    }
  else {
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

  void setError(String errorMessage){
    _error = errorMessage;
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