// verify_code_controller.dart
import 'package:get/get.dart';

class VerifyCodeController extends GetxController {
  var code = ''.obs;

  void setCode(String value) {
    code.value = value;
  }

  void verify() {
    // Add your verification logic here
    // e.g., verify the code and navigate to reset password page
  }
}
