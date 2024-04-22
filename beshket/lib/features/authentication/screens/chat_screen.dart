//Author: <Martin Podmanicky>

import 'dart:convert';

import 'package:beshket/features/authentication/screens/message_screen.dart';
import 'package:beshket/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  int currentPageIndex = 3;
  List<User> users = [];
  Future<void> _fetchUsers() async {
    try {
      final response =
          await http.get(Uri.parse('http://localhost:3000/temp/users'));
      if (response.statusCode == 200) {
        final usersJson = jsonDecode(response.body) as List;
        users = usersJson.map((userJson) => User.fromJson(userJson)).toList();
        setState(() {});
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  initState() {
    super.initState();
    _fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: false,
        title: Text('Chats',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.tertiary)),
      ),
      body: users.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Expanded(
              child: ListView.builder(
                itemCount: users.length,
                shrinkWrap: true,
                itemBuilder: (context, builder) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ChatScreen(user: users[builder].name);
                            },
                          ),
                        );
                        print('Tapped on ${users[builder].name}');
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(users[builder].imageUrl),
                        ),
                        title: Text(users[builder].name),
                        subtitle: Text(users[builder].email),
                        trailing: Text(users[builder].age.toString()),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        tileColor: Theme.of(context).colorScheme.primary,
                        textColor: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
