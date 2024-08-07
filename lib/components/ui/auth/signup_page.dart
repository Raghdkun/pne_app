// sign_up_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pne_app/components/controllers/auth/sign_up_controller.dart';
import 'package:pne_app/components/ui/widgets/auth/dropdown_field.dart';
import 'package:pne_app/components/ui/widgets/auth/email_field.dart';
import 'package:pne_app/components/ui/widgets/auth/name_field.dart';
import 'package:pne_app/components/ui/widgets/auth/password_field.dart';
import 'package:pne_app/components/ui/widgets/auth/remember_me_and_terms.dart';
import 'package:pne_app/components/ui/widgets/auth/sign_up_header.dart';
import 'package:pne_app/components/ui/widgets/auth/signin_text.dart';
import 'package:pne_app/utils/constents/appstates.dart';
import '../widgets/auth/sign_up_button.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Scaffold(
      body: Form(
        key: controller.formstate,
        child: GetBuilder<SignUpController>(
          builder: (controller) {
            if (controller.appState == AppState.loading) {
              return Center(child: CircularProgressIndicator());
            }

            if (controller.dropdownItemsDep.isEmpty) {
              return Center(child: Text('No departments available'));
            }
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SignUpHeader(),
                          SizedBox(height: 16),
                          NameField(
                            controller: controller.name,
                          ),
                          SizedBox(height: 16),
                          EmailField(
                            controller: controller.email,
                          ),
                          SizedBox(height: 16),
                          PasswordField(
                            controller: controller.password,
                          ),
                          SizedBox(height: 16),
                          DropdownField(
                            label: "Choose department",
                            val: controller.choosenDepartment ?? 'Select one',
                            labelText: 'Department',
                            onChanged: (val) {
                              if (val != "Select one") {
                                controller.choosenDepartment = val!;
                                controller.selectedDepartmentId = controller
                                    .departments
                                    .firstWhere((element) =>
                                        element['department'] == val)['id'];

                                print(
                                    "========>>>>> dep id ${controller.selectedDepartmentId}");

                                // Fetch the positions based on the selected department
                                controller.choosePosition(
                                    controller.selectedDepartmentId!);
                              } else {
                                controller.choosenDepartment = "Select one";
                                controller.selectedDepartmentId = null;
                                controller.dropdownItemsPos = ["Select one"];
                                controller.choosenPosition = "Select one";
                                controller.selectedPositionId = null;
                              }
                              controller.update();
                            },
                            items: controller.dropdownItemsDep,
                          ),
                          SizedBox(height: 16),
                          DropdownField(
                              labelText: "Choose Position",
                              label: "Choose Position",
                              val: controller.choosenPosition ?? 'Select one',
                              onChanged: (val) {
                                if (val != "Select one") {
                                  controller.choosenPosition = val!;
                                  controller.selectedPositionId = controller
                                      .positions
                                      .firstWhere((element) =>
                                          element['position'] == val)['id'];
                                  print(
                                      "========>>>>>pos id ${controller.selectedPositionId}");
                                } else {
                                  controller.choosenPosition = "Select one";
                                  controller.selectedPositionId = null;
                                }
                                controller.update();
                              },
                              items: controller.dropdownItemsPos),

                          SizedBox(height: 8),
                          // RememberMeAndTerms(),
                          SizedBox(height: 16),
                          SignUpButton(
                            onPressed: () {
                              // controller.signUp();
                              controller.signUp();
                              // print(controller.position);
                            },
                          ),
                          SizedBox(height: 16),
                          SignInText(),
                          Divider(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
