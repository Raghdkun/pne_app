// sign_up_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pne_app/utils/constents/appstates.dart';
import 'package:pne_app/utils/services/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpController extends GetxController {
  var rememberMe = false.obs;
  var termsAccepted = false.obs;

  List departments = [];
  List positions = [];

  int? selectedDepartmentId;
  int? selectedPositionId;


  List<String> dropdownItemsDep = ["Select one"];
  List<String> dropdownItemsPos = ["Select one"];

  String? choosenDepartment = "Select one";
  String? choosenPosition = "Select one";
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  //editng controllers
  TextEditingController name = TextEditingController();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final supabase = Supabase.instance.client;
  MyServices myServices = Get.find();

  AppState appState = AppState.none;

//
  @override
  void onInit() {
    getData();

    super.onInit();
  }

  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }

  void toggleTermsAccepted() {
    termsAccepted.value = !termsAccepted.value;
  }

  getData() async {
    try {
      var response = await supabase.from("departments").select().execute();
      departments.addAll(response.data);
      print("department data : $departments");

      List<String> departmentNames =
          departments.map((item) => item['department'] as String).toList();

      dropdownItemsDep.addAll(departmentNames);

      choosenDepartment = "Select one";
      selectedDepartmentId = null;

      dropdownItemsPos = ["Select one"];
      choosenPosition = "Select one";
      selectedPositionId = null;

      update();
    } catch (e) {
      print("error in departments : $e");
    }
  }

  choosePosition(int departmentId) async {
    try {
      appState = AppState.loading;
      var response = await supabase
          .from("positions")
          .select()
          .eq("department_id", departmentId)
          .execute();
      positions.clear();
      positions.addAll(response.data);
      print("positions data : $positions");

      // Map the positions to a List<String> for dropdown items
      dropdownItemsPos =
          positions.map((item) => item['position'] as String).toList();

      if (dropdownItemsPos.isNotEmpty) {
        choosenPosition = dropdownItemsPos.first; // Set a default position
      } else {
        choosenPosition = null;
      }

      // Notify GetX that the state has been updated
      update();

      appState = AppState.done;
    } catch (e) {
      appState = AppState.error;
      print("error in positions : $e");
    }
  }

signUp() async {
  if (formstate.currentState!.validate()) {
    try {
      // Directly insert the user into the app_users table
      final response = await Supabase.instance.client
          .from('app_users')
          .insert({
            'name': name.text,
            'email': email.text,
            'password': password.text, // Remember to hash this in a real application
          })
          .select('id')
          .single().execute();
          var userId = response.data['id'];

          
  

      if ( response.data != null) {

               var res = await Supabase.instance.client.from('employees').insert({
        "user_id": userId,
        'department_id': selectedDepartmentId,
        'position_id': selectedPositionId,
        'employee_name': name.text,
      }).single().execute();

      print(res.data); 
        insertEmployee(userId); 
   
        myServices.sharedPreferences.setString("session", "active"); 
        
        myServices.sharedPreferences.setString('userid',response.data['id']);
        // myServices.sharedPreferences.setString('name',response.data['name']);
        // myServices.sharedPreferences.setString('email',response.data['email']);

        print('User inserted successfully with ID: $userId');



        

        // Navigate to another screen if needed
        Get.offAllNamed('/home');
      } else {
        print('Unexpected error: No data returned.');
      }
    } catch (e) {
      print("Problem =====>> $e");
    }
  }
}




  Future<void> insertEmployee(userid) async {
    try {
      var response = await Supabase.instance.client.from('employees').insert({
        "user_id": userid,
        'department_id': selectedDepartmentId,
        'position_id': selectedPositionId,
        'employee_name': name.text,
      }).single().execute(); // Use execute() instead of single() to handle batch inserts properly

      if (response.data != null) {
        // If there's an error, response.error is not null
        print('Error inserting employee: ${response.data!.message}');
      } else {
        print('Employee inserted successfully!');
      }
    } catch (e) {
      // Catch any other unexpected errors
      print('Exception while inserting employee: $e');
    }
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();

    super.dispose();
  }
}
