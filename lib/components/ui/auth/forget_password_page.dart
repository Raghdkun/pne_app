// forget_password_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pne_app/components/controllers/auth/forget_password_controller.dart';
import 'package:pne_app/components/ui/widgets/auth/email_field.dart';
import 'package:pne_app/components/ui/widgets/auth/submit_button.dart';


class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Forget Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EmailField(),
            SizedBox(height: 50),
            SubmitButton(
              text: 'Submit',
              onPressed: controller.submit,
            ),
          ],
        ),
      ),
    );
  }
}
