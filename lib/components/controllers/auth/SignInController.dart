// sign_in_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pne_app/utils/services/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignInController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  //editng controllers
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  MyServices myServices = Get.find();

//
  var rememberMe = false.obs;
  final supabase = Supabase.instance.client;
   final _isLoggedIn = false.obs;
  bool get isLoggedIn => _isLoggedIn.value;
  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }

  signIn() async {
  if (formstate.currentState!.validate()) {
    try {
      // Hash the password (assuming passwords are stored as hashes)
      // final hashedPassword = sha256.convert(utf8.encode(password.text)).toString();

      // Query the app_users table to find a user with the matching email and hashed password
      final response = await Supabase.instance.client
          .from('app_users')
          .select()
          .eq('email', email.text)
          .eq('password', password.text) // Ensure passwords are hashed and compared as hashes
          .single().execute();

      if (response != null && response.data != null) {
        // User found
        final userData = response.data;
        print('User data: $userData');

        // Set login state and navigate to home
        _isLoggedIn.value = true;
        myServices.sharedPreferences.setString("session", "active");

        Get.offAllNamed('/home');
      } else {
        // No matching user found
        print('No user found with provided email and password.');
      }
    } catch (e) {
      print("Error during login: $e");
    }
  }
}

  
}
