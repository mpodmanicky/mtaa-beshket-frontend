//Author: <Martin Podmanicky>

import '../widgets/profile_widget.dart';
import 'package:flutter/material.dart';

import '../services/auth_firebase.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen(
      {required this.authentication,
      required this.userId,
      required this.onSignedOut});

  final FireBaseAuth authentication;
  final VoidCallback onSignedOut;
  final String userId;

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  int currentPageIndex = 1;
  _signOut() async {
    try {
      await widget.authentication.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  // Added styling to text
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BESHKET',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: _signOut,
            child: Text('Logout',
                style: TextStyle(fontSize: 17.0, color: Colors.white)),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 15.0),
          children: <Widget>[
            ProfileWidget(
              //Update name of the logged in user
              name: 'Admin',
              //Create call back function to change to settings screen
              settingsCallback: () {
                print('Button was pressed.');
              },
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                ),
                onSubmitted: (query) {
                  print('Searching for: $query');
                },
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          print('Button was pressed.');
                        },
                        child: Text('Recommended'),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          print('Button was pressed.');
                        },
                        child: Text('Popular'),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
      //navigation bar reusable
      bottomNavigationBar: NavigationBar(
        //indicator colour
        indicatorColor: Colors.lightBlueAccent,
        //index of a page
        selectedIndex: currentPageIndex,
        //callback function what to do to change index
        onDestinationSelected: (int index) {
          setState(() => {currentPageIndex = index});
        },
        //destinations for the navbar
        destinations: [
          NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(
              icon: Icon(Icons.storage_outlined), label: 'Tickets'),
          NavigationDestination(
              icon: Icon(Icons.message_outlined), label: 'Chats'),
        ],
      ),
    );
  }
}
