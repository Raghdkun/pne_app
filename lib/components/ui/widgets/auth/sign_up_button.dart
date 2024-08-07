// sign_up_button.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:pne_app/components/controllers/auth/sign_up_controller.dart';

class SignUpButton extends StatelessWidget {
  final void Function()? onPressed ;
  const SignUpButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignUpController>();
    return ElevatedButton(
        onPressed:  onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          padding: EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 32,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          'Sign Up',
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      );
  }
}
