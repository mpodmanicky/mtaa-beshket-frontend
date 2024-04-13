import 'package:flutter/material.dart';
 
import 'package:beshket/features/authentication/services/auth_firebase.dart';
 
class HomeScreen extends StatefulWidget {
  HomeScreen({required this.authentication, required this.userId, required this.onSignedOut});
 
  final FireBaseAuth authentication;
  final VoidCallback onSignedOut;
  final String userId;
 
  @override
  State<StatefulWidget> createState() => _HomePageState();
}
 
class _HomePageState extends State<HomeScreen> {
 
  _signOut() async {
    try {
      await widget.authentication.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        actions: <Widget>[
          TextButton(
              onPressed: _signOut,
              child: Text('Logout',
                  style: TextStyle(fontSize: 17.0, color: Colors.white)),)
        ],
      ),
      body: Center(
        child: Text("hello"),
      ),
    );
  }
}
