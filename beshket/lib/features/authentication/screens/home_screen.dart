//Author: <Martin Podmanicky>

import 'package:beshket/blocs/bottom_nav_cubit.dart';
import 'package:beshket/features/authentication/screens/cart_screen.dart';
import 'package:beshket/features/authentication/screens/chat_screen.dart';
import 'package:beshket/features/authentication/screens/homescreen_after_auth.dart';
import 'package:beshket/features/authentication/screens/tickets_screen.dart';
import 'package:beshket/features/authentication/widgets/destinations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  String _userId = '';
  String get userId => _userId;

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
      body: BlocProvider(
        create: (context) => BottomNavCubit(),
        child: SafeArea(
          child: PageView(
            controller: PageController(initialPage: currentPageIndex),
            onPageChanged: (index) =>
                context.read<BottomNavCubit>().changeSelectedIndex(index),
            children: <Widget>[
              MainScreen(),
              Tickets(),
              Chats(),
              Cart(),
            ],
          ),
        ),
      ),
      //navigation bar reusable
      bottomNavigationBar: BlocProvider.value(
        value: BlocProvider.of<BottomNavCubit>(context),
        child: NavigationBar(
          elevation: 1,
          backgroundColor: Colors.white,
          indicatorColor: const Color.fromARGB(255, 213, 233, 241),
          destinations: destinations.map<NavigationDestination>((d) {
            return NavigationDestination(
              icon: Icon(d.icon),
              label: d.label,
            );
          }).toList(),
          selectedIndex: BlocProvider.of<BottomNavCubit>(context).state,
          onDestinationSelected: (index) =>
              context.read<BottomNavCubit>().changeSelectedIndex(index),
        ),
      ),
    );
  }
}
