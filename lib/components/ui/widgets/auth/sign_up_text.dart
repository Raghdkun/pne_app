// sign_up_text.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpText extends StatelessWidget {
  const SignUpText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: GoogleFonts.poppins(fontSize: 14),
        ),
        TextButton(
          onPressed: () {
            Get.offAllNamed('/signup'); 
          },
          child: Text(
            'Sign Up',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
