//Author: <Martin Podmanicky>

import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String name;
  final Function settingsCallback;

  const ProfileWidget(
      {Key? key, required this.name, required this.settingsCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
        ),
        //Avatar
        CircleAvatar(
          radius: 40.0,
          backgroundImage: NetworkImage('https://www.example.com/avatar.jpg'),
        ),
        //Name
        SizedBox(
          width: 16,
        ),
        Text(
          name,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        //Spacer to position the button to the far right
        Spacer(),
        //Settings Button
        SizedBox(
          width: 16,
        ),
        IconButton(
            onPressed: settingsCallback(),
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            icon: Icon(Icons.settings)),
      ],
    );
  }
}
