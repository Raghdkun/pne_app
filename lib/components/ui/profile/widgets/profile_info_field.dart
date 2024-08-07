// profile_info_field.dart
import 'package:flutter/material.dart';

class ProfileInfoField extends StatelessWidget {
  final IconData icon;
  final TextEditingController? controller ; 
  final String label;
  final String? value;
  final bool isPassword;
  final bool isReadOnly; 

  ProfileInfoField({
    required this.icon,
    required this.label,
     this.value,
    this.isPassword = false, required this.isReadOnly,  this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      
      readOnly: isReadOnly,
      obscureText: isPassword,
      decoration: InputDecoration(
        
        labelText: label,
        hintText: value,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
