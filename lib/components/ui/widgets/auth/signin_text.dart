// sign_up_text.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInText extends StatelessWidget {
  const SignInText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Have an account?",
          style: GoogleFonts.poppins(fontSize: 14),
        ),
        TextButton(
          onPressed: () {
            Get.offAllNamed('/login');  
          },
          child: Text(
            'Sign in',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
