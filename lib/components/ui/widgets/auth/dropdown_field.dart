// dropdown_field.dart
import 'package:flutter/material.dart';

class DropdownField extends StatelessWidget {
  final String labelText;
  final List<String> items;
 final void Function(String?)? onChanged ; 
  final String val; 
  final String? label ;

  const DropdownField({super.key, required this.labelText, required this.items, required this.val, this.onChanged, this.label});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: val ,
      decoration: InputDecoration(
        
        // labelText: labelText,
        // hintText: hintText ,
        label: Text(label!),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      items: items
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              ))
          .toList(),
      onChanged: onChanged
    );
  }
}
