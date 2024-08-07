// logout_button.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pne_app/components/controllers/profile/profile_controller.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return ElevatedButton(
      onPressed: controller.logout,
      style: ElevatedButton.styleFrom(
       
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 100),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        'Logout',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}
