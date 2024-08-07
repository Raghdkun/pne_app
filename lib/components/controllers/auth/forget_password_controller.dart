// forget_password_controller.dart
import 'package:get/get.dart';
import 'package:pne_app/components/ui/auth/verify_code_page.dart';

class ForgetPasswordController extends GetxController {
  var email = ''.obs;

  void setEmail(String value) {
    email.value = value;
  }

  void submit() {
    // Add your submission logic here, e.g., send a verification code to the email
    Get.to(() => VerifyCodePage());
  }
}
