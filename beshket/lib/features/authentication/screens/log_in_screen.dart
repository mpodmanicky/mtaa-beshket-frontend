import 'dart:convert';

import 'package:beshket/features/authentication/screens/home_screen.dart';
import 'package:beshket/features/authentication/widgets/custom_signin_button.dart';
import 'package:beshket/features/authentication/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginForm extends StatefulWidget {
  final void Function()? onTap;
  const LoginForm({super.key, required this.onTap});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _email = "";
  String _password = "";
  String _username = "";
  bool _authenticated = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          'Beshket',
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.login_rounded,
                  size: 80,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                SizedBox(height: 60),
                Text('Welcome to Beshket! Please Log In.',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    )),
                SizedBox(height: 20),
                CustomTextField(
                  controller: _emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  controller: _passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                SizedBox(height: 20),
                MyButton(
                    hintText: 'Sign In',
                    onTap: () async {
                      setState(() {
                        _email = _emailController.text;
                        _password = _passwordController.text;
                      });
                      final response = await validateLogin(_email, _password);
                      if (response == 'OK') {
                        print('Login successful');
                        _authenticated = true;
                        checkAuthentication(_authenticated);
                      } else {
                        print('Login failed');
                      }
                    }),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not a member?',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        )),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<String> validateLogin(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      return 'Please fill in all fields.';
    } else {
      final response = await http.post(
        Uri.parse('http://localhost:3000/admin'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: {'Content-Type': 'application/json'},
        encoding: Encoding.getByName('utf-8'),
      );
      if (response.statusCode == 200) {
        _username = jsonDecode(response.body)['username'];
        return 'OK';
      } else {
        return 'Failed to connect to server.';
      }
    }
  }

  void checkAuthentication(bool authenticated) {
    if (authenticated) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(name: _username),
        ),
      );
    }
  }
}
