// name_field.dart
import 'package:flutter/material.dart';

class NameField extends StatelessWidget {
  final TextEditingController? controller ; 
  const NameField({super.key,  this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Full Name',
        hintText: 'Enter your name',
        prefixIcon: Icon(Icons.person_outline),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
