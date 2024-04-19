import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AgeTextField extends StatelessWidget {
  const AgeTextField({
    super.key,
    required this.controller,
    required this.hintText,
  });

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number, // Set keyboard type to number
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly, // Allow only digits
      ],
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: hintText,
        errorText: _validateAge(controller.text), // Show error if invalid
      ),
    );
  }

  String? _validateAge(String text) {
    int? age = int.tryParse(text);
    if (age == null || age < 16 || age > 120) {
      return 'To register you have to be atleast 16 years old.';
    }
    return null; // No error
  }
}
