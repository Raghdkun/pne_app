// profile_controller.dart
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pne_app/utils/constents/appstates.dart';
import 'package:pne_app/utils/services/authservice.dart';
import 'package:pne_app/utils/services/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TextEditingController password = TextEditingController();
  late TabController tabController;
  var isPasswordEmpty = true.obs;
  MyServices myServices = Get.find();

  AppState appState = AppState.none;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List roleData = [];

  String username = '';
  String department = '';
  String position = '';
  String userMail = '';
  String savedemployeeId = '';

  TextEditingController whatItIs = TextEditingController();
  TextEditingController defineIt = TextEditingController();
  TextEditingController example = TextEditingController();
  TextEditingController otherPeopleNeeded = TextEditingController();

  final SupabaseClient supabase = Supabase.instance.client;
  final AuthService authService = Get.find<AuthService>();

  var employeeData = {}.obs;
  var authData = {}.obs;
  var isLoading = false.obs;

  @override
  void dispose() {
    whatItIs.dispose();
    defineIt.dispose();
    example.dispose();
    otherPeopleNeeded.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    password.addListener(() {
      isPasswordEmpty.value = password.text.isEmpty;
      update();
    });
    tabController = TabController(length: 2, vsync: this);
    getCurrentEmployeeData();
    // getRoleDescriptions();
  }

  Future<void> getCurrentEmployeeData() async {
    try {
      // Get the userId from shared preferences
      appState = AppState.loading;
      String userId = myServices.sharedPreferences.getString('userid')!;

      // Query the view to get the current employee data
      final response = await Supabase.instance.client
          .from('user_employee_data')
          .select()
          .eq('user_id', userId)
          .execute();

      if (response != null &&
          response.data != null &&
          response.data.isNotEmpty) {
        // Iterate over the list of results (in case there are multiple rows)
        for (var employeeData in response.data) {
          print('Employee Data: $employeeData');

          // Extract the data from each row
          String employeeName = employeeData['employee_name'];
          String departmentName = employeeData['department'];
          String positionName = employeeData['position'] ?? '';
          userMail = employeeData['user_email'];
          myServices.sharedPreferences
              .setString('employee_id', employeeData['employee_id']);
          savedemployeeId =
              myServices.sharedPreferences.getString('employee_id')!;

          print("emplyee id: $savedemployeeId");
          getRoleDescriptions();
          // Example: Storing in shared preferences or using in the UI
          print('Employee Name: $employeeName');
          print('Department ID: $departmentName');
          print('Position ID: $positionName');

          username = employeeName;
          department = departmentName;
          position = positionName;
          appState = AppState.done;
          // getRoleDescriptions();
          update();
        }
      } else {
        print('No data found for the current user.');
      }
    } catch (e) {
      print('Error fetching employee data: $e');
    }
  }

// Function to get role descriptions and update state
// Function to get role descriptions and update state
  Future<void> getRoleDescriptions() async {
    try {
      appState = AppState.loading;

      final response = await Supabase.instance.client
          .from('role_description')
          .select()
          .eq('employee_id', savedemployeeId)
          .execute();

      print("role data ${response.data}");

      if (response.data != null) {
        // print('Error fetching role descriptions: ${response.data!.message}');
        roleData.addAll(response.data);
        update();

        appState = AppState.error;
      } else {
        print('No role descriptions found for this employee.');
        roleData = [];
        update();
        appState = AppState.done;
      }
    } catch (e) {
      print('Error during role description retrieval: $e');
      appState = AppState.error;
    }
  }

  Future<void> insertRoleDescription() async {
    try {
      final response =
          await Supabase.instance.client.from('role_description').insert({
        'employee_id': savedemployeeId,
        'what_it_is': whatItIs.text,
        'define_it': defineIt.text,
        'example': example.text,
        'other_people_needed': otherPeopleNeeded.text,
      }).execute();
      update();
      roleData.clear();
      whatItIs.clear();
      defineIt.clear();
      example.clear();
      otherPeopleNeeded.clear();
      getRoleDescriptions();
      Get.offNamed('/home');

      if (response.data != null) {
        print('Error inserting role description: ${response.data!.message}');
      } else {
        print('Role description inserted successfully!');
      }
    } catch (e) {
      print('Error during role description insertion: $e');
    }
  }

  List<Map<String, dynamic>> kpiList = [
    {
      'question': 'What is it?',
      'answer': 'example',
    },
    {
      'question': 'Define it?',
      'answer': 'example',
    },
    {
      'question': 'How do you Measure it?',
      'answer': 'example',
    },
    {
      'question': 'Example',
      'answer': 'example',
    },
    {
      'question': 'Comments',
      'answer': 'example',
    },
  ];

  List<Map<String, dynamic>> managersFeedback = [
    {
      'field': 'Date',
      'value': 'example',
    },
    {
      'field': 'Feedback Giver Name',
      'value': 'example',
    },
    {
      'field': 'Feedback Summary',
      'value': 'example',
    },
    {
      'field': 'Action Items/Next Steps',
      'value': 'example',
    },
    {
      'field': 'Comments',
      'value': 'example',
    },
  ];

  void logout() {
    // Add logout logic here
    Get.snackbar('Logout', 'Successfully logged out');
  }

  save() async {}
}
