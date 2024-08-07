// remember_me_and_terms.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:pne_app/components/controllers/auth/sign_up_controller.dart';
import 'package:pne_app/components/ui/widgets/auth/terms_page.dart';

class RememberMeAndTerms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignUpController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        Row(
          children: [
            Obx(
              () => Checkbox(
                value: controller.termsAccepted.value,
                onChanged: (bool? value) {
                  controller.toggleTermsAccepted();
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => const TermsPage());
              },
              child: Text(
                'I agree to Terms & Conditions',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
