// email_field.dart
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final TextEditingController? controller ; 
  const EmailField({super.key,  this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller ,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Enter your email',
        prefixIcon: Icon(Icons.email_outlined),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
