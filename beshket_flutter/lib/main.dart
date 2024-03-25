import 'package:beshket/global_variables/global_app_bar.dart';
import 'package:beshket/global_variables/global_scaffold.dart';
import 'package:beshket/features/authentication/services/authentication_root.dart';
import 'package:beshket/features/authentication/services/auth_firebase.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(StartingPage());
}

class StartingPage extends StatelessWidget {
  
  const StartingPage({super.key});

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
      //onGenerateRoute: (settings) => generateRoute(settings),
      home: AuthenticationRoot(authentication: Authentication(),),
    );
  }
    

}



