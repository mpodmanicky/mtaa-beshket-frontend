import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text('Settings', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Center(
              child: ElevatedButton(
                child: Text('Push me!'),
                onPressed: () {
                  print('Settings button pressed.');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
