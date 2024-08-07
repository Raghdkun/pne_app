// profile_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pne_app/components/controllers/profile/profile_controller.dart';
import 'package:pne_app/components/ui/profile/tabs/general_tab.dart';
import 'package:pne_app/components/ui/profile/tabs/personal_tabs.dart';
import 'package:pne_app/utils/theme/curvy_app_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        CurvyAppBar(
          title: 'Profile',
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              // height: Get.height,
              child: GeneralTab(
                  empName:
                      // "${controller.employeeData['employee_name']}",
                      'example',
                  empPosition:
                      // "${controller.employeeData['position']}",
                      'example'),
            ),
          ),
        ),
      ],
    ));
  }
}
