//Author: <Martin Podmanicky>
import 'package:flutter/material.dart';
import 'package:beshket/features/authentication/screens/screens.dart';

class ProfileWidget extends StatelessWidget {
  final String name;

  const ProfileWidget({
    Key? key,
    required this.name,
  }) : super(key: key);

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
          backgroundImage: NetworkImage(
              'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            icon: Icon(Icons.settings)),
      ],
    );
  }
}
