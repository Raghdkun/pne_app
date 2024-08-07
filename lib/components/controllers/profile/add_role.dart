import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pne_app/components/controllers/profile/profile_controller.dart';
import 'package:pne_app/utils/theme/curvy_app_bar.dart';
// Import your ProfileController

class RoleDescriptionForm extends StatelessWidget {
  const RoleDescriptionForm({super.key});

  // Get the controller instance

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.find();
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        CurvyAppBar(title: 'Add Role Description'),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: controller.formKey,
              child: SizedBox(
                height: Get.height,
                child: ListView(
                  children: [
                    // Employee ID field
                    _buildTextField(
                      label: 'What It Is',
                      textController: controller.whatItIs,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a description';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0), // Space between fields
                    // Define It field
                    _buildTextField(
                      label: 'Define It',
                      textController: controller.defineIt,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please define it';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0), // Space between fields
                    // Example field
                    _buildTextField(
                      label: 'Example',
                      textController: controller.example,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please provide an example';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0), // Space between fields
                    // Other People Needed field
                    _buildTextField(
                      textController: controller.otherPeopleNeeded,
                      label: 'Other People Needed',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please specify other people needed';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24.0), // Space before the submit button
                    // Submit button
                    ElevatedButton(
                      onPressed: () => controller.insertRoleDescription(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        textStyle: TextStyle(fontSize: 18.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }

  // Method to build a TextFormField with consistent styling
  Widget _buildTextField({
    required String label,
  
    required FormFieldValidator<String?> validator,
    required TextEditingController textController,
  }) {
    return TextFormField(
      controller: textController ,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.red),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple),
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      
      validator: validator,
    );
  }
}
