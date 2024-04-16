import 'package:beshket/features/authentication/screens/chat_screen.dart';
import 'package:beshket/features/authentication/screens/home_screen.dart';
import 'package:beshket/features/authentication/screens/tickets_screen.dart';
import 'package:beshket/features/authentication/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
                child: Text('Shopping Cart'),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        //indicator colour
        indicatorColor: Colors.lightBlueAccent,
        //index of a page
        selectedIndex: currentPageIndex,
        //callback function what to do to change index
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
          switch (index) {
            case 0:
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Tickets()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Tickets()),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Chats()),
              );
          }
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
