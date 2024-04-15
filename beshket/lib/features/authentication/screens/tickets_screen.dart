import 'package:beshket/features/authentication/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

class Tickets extends StatelessWidget {
  const Tickets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavBar(),
    );
    ;
  }
}
