// import '../services/auth_firebase.dart';
// import '../screens/login_screen.dart';
// import '../screens/home_screen.dart';
// import '../screens/progress_screen.dart';
// import 'package:flutter/material.dart';

// class AuthenticationRoot extends StatefulWidget {
//   AuthenticationRoot({required this.authentication});

//   final FireBaseAuth authentication;

//   @override
//   State<StatefulWidget> createState() => _AuthenticationRootState();
// }

// enum AuthenticationStatus { loggedOut, loggedIn, notDetermined }

// class _AuthenticationRootState extends State<AuthenticationRoot> {
//   AuthenticationStatus authenticationStatus =
//       AuthenticationStatus.notDetermined;
//   String _userId = '';

//   @override
//   void initState() {
//     super.initState();
//     widget.authentication.getCurrentUser().then((user) {
//       setState(() {
//         if (user != null) {
//           _userId = user.uid;
//           authenticationStatus = AuthenticationStatus.loggedIn;
//         } else {
//           authenticationStatus = AuthenticationStatus.loggedOut;
//         }
//       });
//     });
//   }

//   void _onLoggedIn() {
//     widget.authentication.getCurrentUser().then((user) {
//       setState(() {
//         _userId = user!.uid.toString();
//       });
//     });
//     setState(() {
//       authenticationStatus = AuthenticationStatus.loggedIn;
//     });
//   }

//   void _onSignedOut() {
//     setState(() {
//       authenticationStatus = AuthenticationStatus.loggedOut;
//       _userId = '';
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     switch (authenticationStatus) {
//       case AuthenticationStatus.loggedOut:
//         return LoginScreen(
//             authentication: widget.authentication, onSignedIn: _onLoggedIn);
//       case AuthenticationStatus.loggedIn:
//         if (_userId.isNotEmpty) {
//           return HomeScreen(
//             userId: _userId,
//             authentication: widget.authentication,
//             onSignedOut: _onSignedOut,
//           );
//         } else {
//           return ProgressScreen();
//         }
//       case AuthenticationStatus.notDetermined:
//         return ProgressScreen();
//       default:
//         return ProgressScreen();
//     }
//   }
// }
