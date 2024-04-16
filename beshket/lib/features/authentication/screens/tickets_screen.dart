import 'package:beshket/features/authentication/screens/cart_screen.dart';
import 'package:beshket/features/authentication/screens/chat_screen.dart';
import 'package:beshket/features/authentication/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

class Tickets extends StatefulWidget {
  const Tickets({super.key});

  @override
  State<Tickets> createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
  int currentPageIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
                child: Text('Tickets Screen'),
                onPressed: () {
                  Navigator.pop(context);
                }),
          )
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Cart()),
              );
              break;
            case 1:
              break;
            case 2:
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
