// logout_button.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pne_app/components/controllers/profile/profile_controller.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return Obx(() => controller.isPasswordEmpty.value
          ? SizedBox()
          : ElevatedButton(
      onPressed: controller.save,
      style: ElevatedButton.styleFrom(
       
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 108),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        'Save',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    ),);
  }
}
