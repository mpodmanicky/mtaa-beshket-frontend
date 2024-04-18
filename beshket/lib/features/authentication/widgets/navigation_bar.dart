//Author: <Martin Podmanicky>

import 'package:beshket/features/authentication/screens/cart_screen.dart';
import 'package:beshket/features/authentication/screens/chat_screen.dart';
import 'package:beshket/features/authentication/screens/tickets_screen.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  final List<Widget> screens = [
    Chats(),
    Tickets(),
    Cart(),
  ];

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: [
        NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
        NavigationDestination(
            icon: Icon(Icons.storage_outlined), label: 'Tickets'),
        NavigationDestination(
            icon: Icon(Icons.message_outlined), label: 'Chats'),
      ],
      selectedIndex: currentIndex,
      onDestinationSelected: (int index) {
        setState(() {
          currentIndex = index;
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => widget.screens[index]));
        });
      },
    );
  }
}
