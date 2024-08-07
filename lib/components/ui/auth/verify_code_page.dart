// verify_code_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pne_app/components/controllers/auth/verify_code_controller.dart';
import 'package:pne_app/components/ui/widgets/auth/code_field.dart';
import 'package:pne_app/components/ui/widgets/auth/submit_button.dart';


class VerifyCodePage extends StatelessWidget {
  const VerifyCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyCodeController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify Code'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CodeField(),
            SizedBox(height: 16),
            SubmitButton(
              text: 'Verify',
              onPressed: controller.verify,
            ),
          ],
        ),
      ),
    );
  }
}
