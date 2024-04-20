// import 'package:beshket/features/authentication/screens/log_in_screen.dart';
// import 'package:beshket/features/authentication/screens/register_screen.dart';
// import 'global_variables/global_app_bar.dart';
// import 'global_variables/global_scaffold.dart';
// import 'features/authentication/services/authentication_root.dart';
// import 'features/authentication/services/auth_firebase.dart';
import 'package:beshket/features/authentication/services/login_or_register.dart';
import 'package:beshket/themes/theme_provider.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeModeProvider(),
    child: StartingPage(),
  ));
}

class StartingPage extends StatelessWidget {
  const StartingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beshket',
      theme: Provider.of<ThemeModeProvider>(context).themeData,
      //onGenerateRoute: (settings) => generateRoute(settings),
      home: LoginOrRegister(),
      //AuthenticationRoot(authentication: Authentication(),),
    );
  }
}
