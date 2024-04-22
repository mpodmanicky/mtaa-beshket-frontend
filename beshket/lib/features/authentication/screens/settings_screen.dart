//<Martin Podmanicky>
import 'package:beshket/themes/theme_provider.dart';
import 'package:beshket/themes/themes.dart';
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
        title: Text('Settings',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        actions: [
          IconButton(
              icon: Icon(
                Provider.of<ThemeModeProvider>(context).themeData == lightMode
                    ? Icons.dark_mode
                    : Icons.light_mode,
              ),
              onPressed: () {
                Provider.of<ThemeModeProvider>(context, listen: false)
                    .toggleTheme();
              }),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              tileColor: Theme.of(context).colorScheme.primary,
              title: Text('Change Password'),
              leading: Icon(Icons.lock),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                //Navigator.of(context).pushNamed('/change-password');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              tileColor: Theme.of(context).colorScheme.primary,
              title: Text('Change Email'),
              leading: Icon(Icons.email),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                //Navigator.of(context).pushNamed('/change-email');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              tileColor: Theme.of(context).colorScheme.primary,
              title: Text('Change Username'),
              leading: Icon(Icons.person),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                //Navigator.of(context).pushNamed('/change-username');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              tileColor: Theme.of(context).colorScheme.primary,
              title: Text('Change Profile Picture'),
              leading: Icon(Icons.image),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                //Navigator.of(context).pushNamed('/change-profile-picture');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              tileColor: Theme.of(context).colorScheme.primary,
              title: Text('Delete Account'),
              leading: Icon(Icons.delete),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                //Navigator.of(context).pushNamed('/delete-account');
              },
            ),
          ),
        ],
      ),
    );
  }
}
