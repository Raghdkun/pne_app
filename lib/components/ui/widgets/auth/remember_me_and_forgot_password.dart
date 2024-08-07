// remember_me_and_forgot_password.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:pne_app/components/controllers/auth/SignInController.dart';
import 'package:google_fonts/google_fonts.dart';

class RememberMeAndForgotPassword extends StatelessWidget {
  const RememberMeAndForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignInController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Obx(
              () => Checkbox(
                value: controller.rememberMe.value,
                onChanged: (bool? value) {
                  controller.toggleRememberMe();
                },
              ),
            ),
            Text(
              'Remember me',
              style: GoogleFonts.poppins(fontSize: 14),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            context.goNamed('forgetpassword'); 
          },
          child: Text(
            'Forget Password?',
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
