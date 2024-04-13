/*import 'package:beshket/features/authentication/widgets/authentication_email_form.dart';
import 'package:beshket/global_variables/authenticaton/authentication_container.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class AuthenticationScreen extends StatefulWidget {
  static const String routeName= '/authentication_screen';
  const AuthenticationScreen({Key? key}): super(key: key);


  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Center(
          child: Text('Beshket')
        ),
      ),
      body: SafeArea(
        child: Center( 
          child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                    Container(
                      color: AuthenticationContainerStyle.containerColor,
                      child: Form(
                              child: Column(
                                children: [
                                  AuthenticationEmailForm(controller: _emailController, hintText: 'Email', isPassword: false),
                                  SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                                  AuthenticationTextField(controller: _passwordController, hintText: 'Password', isPassword: true),
                                  SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                                  RichText(text: TextSpan(
                                    text: 'Sign In',
                                    style: TextStyle(color: Colors.blue),
                                    recognizer: TapGestureRecognizer()..onTap = () {
                                        print('Sign In called');
                                      }
                                  )),
                                  SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                                  ElevatedButton(
                                    onPressed: () {}, 
                                    child: Text('Login')
                                    )
                                ],
                                )
                            )
                    ),
                  ],
                ),
          )
      )
    );
  }
}*/