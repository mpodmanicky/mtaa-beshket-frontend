//Author: <Martin Podmanicky>

import 'package:beshket/features/authentication/screens/cart_screen.dart';
import 'package:beshket/features/authentication/screens/chat_screen.dart';
import 'package:beshket/features/authentication/screens/homescreen_after_auth.dart';
import 'package:beshket/features/authentication/screens/tickets_screen.dart';
import 'package:flutter/material.dart';

import '../services/auth_firebase.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    required this.authentication,
    required this.userId,
    required this.onSignedOut,
  });

  final FireBaseAuth authentication;
  final VoidCallback onSignedOut;
  final String userId;

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  int currentPageIndex = 0;
  final PageController _controller = PageController();
  @override
  void initState() {
    super.initState();
  }

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
        child: PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          children: const <Widget>[
            MainScreen(),
            Tickets(),
            Chats(),
            Cart(),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) {
          setState(() {
            currentPageIndex = index;
          });
          _controller.animateToPage(currentPageIndex,
              duration: Duration(milliseconds: 300), curve: Curves.ease);
        },
        selectedIndex: currentPageIndex,
        elevation: 1.0,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.storage_rounded),
            label: 'Tickets',
          ),
          NavigationDestination(
            icon: Icon(Icons.message_rounded),
            label: 'Chats',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart_rounded),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
