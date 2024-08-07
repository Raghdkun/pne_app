// code_field.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pne_app/components/controllers/auth/verify_code_controller.dart';

class CodeField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<VerifyCodeController>();
    return TextField(
      decoration: InputDecoration(
        labelText: 'Verification Code',
        hintText: 'Enter the verification code',
        prefixIcon: Icon(Icons.code_outlined),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onChanged: (value) => controller.setCode(value),
    );
  }
}
