// sign_in_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pne_app/components/controllers/auth/SignInController.dart';
import 'package:pne_app/components/ui/widgets/auth/email_field.dart';
import 'package:pne_app/components/ui/widgets/auth/password_field.dart';
import 'package:pne_app/components/ui/widgets/auth/remember_me_and_forgot_password.dart';
import 'package:pne_app/components/ui/widgets/auth/sign_in_button.dart';
import 'package:pne_app/components/ui/widgets/auth/sign_in_header.dart';
import 'package:pne_app/components/ui/widgets/auth/sign_up_text.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());
    return Scaffold(
      key: GlobalKey(),
      body: Form(
        key: controller.formstate,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SignInHeader(),
                    SizedBox(height: 16),
                    EmailField(controller: controller.email,),
                    SizedBox(height: 16),
                    PasswordField(controller: controller.password,),
                    SizedBox(height: 8),
                    RememberMeAndForgotPassword(),
                    SizedBox(height: 16),
                    SignInButton(onPressed: () async {
                      controller.signIn(); 
                     await controller.supabase.auth.signOut() ; 
                      // controller.supabase.auth.currentSession!.user.email!; 
                    },),
                    SizedBox(height: 16),
                    SignUpText(),
                    Divider(),
                    // Text(
                    //   'OR',
                    //   style: GoogleFonts.poppins(fontSize: 14),
                    // ),
                    // SizedBox(height: 16),
                    // SocialSignInButtons(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
