// import 'dart:convert';

import 'package:beshket/features/authentication/widgets/homescreen_buttons.dart';
import 'package:beshket/features/authentication/widgets/profile_widget.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.name});
  final String name;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // String _buttonText = 'Push me!';
  String _username = '';
  String get name => _username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: ProfileWidget(name: _username),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: SearchBar(
              leading: Icon(Icons.search),
              hintText: 'Search',
              onSubmitted: (query) {
                print('Searched for $query');
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: SegmentedFilterButton(),
          ),
          //Connection to node.js server successful
          // Center(
          //   child: ElevatedButton(
          //     onPressed: () async {
          //       final response =
          //           await http.get(Uri.parse('http://localhost:3000/test'));
          //       print('Response from server: ${response.body}');
          //       setState(() {
          //         _buttonText = jsonDecode(response.body)['message'];
          //       });
          //     },
          //     child: Text(_buttonText),
          //   ),
          // ),
        ],
      ),
    );
  }
}
