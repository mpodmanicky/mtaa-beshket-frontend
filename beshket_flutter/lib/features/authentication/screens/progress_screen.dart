import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget{
   const ProgressScreen({Key? key}): super(key: key);

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator()
      )
    );
   }
}