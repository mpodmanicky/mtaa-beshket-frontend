import 'package:beshket/features/authentication/widgets/homescreen_buttons.dart';
import 'package:beshket/features/authentication/widgets/profile_widget.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: ProfileWidget(name: 'Name'),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: SearchBar(
              leading: Icon(Icons.search),
              hintText: 'Search',
              onSubmitted: (query) {
                print('Searched for $query');
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: SegmentedFilterButton(),
          )
        ],
      ),
    );
  }
}
