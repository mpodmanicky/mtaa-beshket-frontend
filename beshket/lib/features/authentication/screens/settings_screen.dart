//<Martin Podmanicky>
import 'package:beshket/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text('Settings', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
              icon: Icon(Icons.dark_mode),
              onPressed: () {
                Provider.of<ThemeModeProvider>(context, listen: false)
                    .toggleTheme();
              }),
        ],
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
