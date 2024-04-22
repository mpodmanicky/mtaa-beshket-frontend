import 'dart:convert';

import 'package:beshket/features/authentication/widgets/age_textfield.dart';
import 'package:beshket/features/authentication/widgets/custom_signin_button.dart';
import 'package:beshket/features/authentication/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _passwordConfrimController =
      TextEditingController();

  String _email = "";
  String _password = "";
  String _name = "";
  int _age = 0;
  String _passwordConfirm = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          'Beshket',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                  Icons.app_registration_rounded,
                  size: 80,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                SizedBox(height: 20),
                Text('Welcome to Beshket! Please register.',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    )),
                SizedBox(height: 10),
                CustomTextField(
                  controller: _nameController,
                  hintText: 'Your name',
                  obscureText: false,
                ),
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
                CustomTextField(
                  controller: _passwordConfrimController,
                  hintText: 'Confirm password',
                  obscureText: true,
                ),
                SizedBox(height: 20),
                AgeTextField(
                  controller: _ageController,
                  hintText: 'Age',
                ),
                SizedBox(height: 20),
                MyButton(
                    hintText: 'Register',
                    onTap: () async {
                      setState(() {
                        _email = _emailController.text;
                        _password = _passwordController.text;
                        _name = _nameController.text;
                        _age = int.parse(_ageController.text);
                        _passwordConfirm = _passwordConfrimController.text;
                      }); // Save the values
                      try {
                        final response = await http.post(
                            Uri.parse(
                                'http://localhost:3000/temp/register/users'),
                            body: jsonEncode({
                              'name': _name,
                              'email': _email,
                              'password': _password,
                              'passwordConfirm': _passwordConfirm,
                              'age': _age,
                              'imageUrl':
                                  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png',
                            }),
                            headers: {'Content-Type': 'application/json'},
                            encoding: Encoding.getByName('utf-8'));
                        if (response.statusCode == 201) {
                          print('User registered successfully');
                        } else {
                          print('Failed to connect to server.');
                        }
                      } catch (error) {
                        print(error);
                      }
                      print(_name +
                          _email +
                          _password +
                          _passwordConfirm +
                          _age.toString());
                    }),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already a member?',
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
                        'Sign In',
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
}
