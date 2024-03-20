import 'package:beshket/features/authentication/screens/authentication_screen.dart';
import 'package:beshket/global_variables/global_app_bar.dart';
import 'package:beshket/global_variables/global_scaffold.dart';
import 'package:beshket/router.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(Authentication());
}

class Authentication extends StatelessWidget {
  
  const Authentication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beshket',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalScaffold.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalScaffold.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: GlobalAppBar.appBarColor,
          titleTextStyle: TextStyle(
            color: GlobalAppBar.appBarTextColor,
            fontSize: GlobalAppBar.appBarTextSize,
            fontWeight: GlobalAppBar.appBarTextWeight
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
          )
        )
      ), 
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const AuthenticationScreen(),
    );
  }
    

}



