//Author: <Martin Podmanicky>

import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final int currentIndex; // Index of the currently selected item
  //final Function(int) onItemSelected; // Callback to handle item selection

  const NavBar({
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed, // Fixed number of icons
      currentIndex: currentIndex,
      //onTap: onItemSelected,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.event),
          label: 'My Events',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Chat',
        ),
      ],
    );
  }
}
