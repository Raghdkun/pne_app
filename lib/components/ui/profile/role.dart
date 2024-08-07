import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pne_app/components/controllers/profile/profile_controller.dart';
import 'package:pne_app/components/ui/profile/tabs/widgets/info.dart';
import 'package:pne_app/utils/constents/appstates.dart';
import 'package:pne_app/utils/theme/curvy_app_bar.dart';

class RolePage extends StatelessWidget {
  const RolePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/insert-role');
        },
        child: Icon(Icons.add),
      ),
      body: CustomScrollView(
        slivers: [
          CurvyAppBar(title: "Role Description"),
          SliverToBoxAdapter(child: GetBuilder<ProfileController>(
            builder: (controller) {
              if (controller.appState == AppState.loading) {
                return Center(child: CircularProgressIndicator());
              }
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    ...List.generate(
                      controller.roleData.length,
                      (index) => Info(
                        mainTitle: "Role Description",
                        firstTitle: "What is it?",
                        secTitle: "Define it?",
                        thirdTitle: "Example",
                        forthTitle: "Other people needed?",
                        sub1: "${controller.roleData[index]['what_it_is']}",
                        sub2: "${controller.roleData[index]['define_it']}",
                        sub3: "${controller.roleData[index]['example']}",
                        sub4: "${controller.roleData[index]['other_people_needed']}",
                        icon1: Icons.question_answer,
                        icon2: Icons.question_answer,
                        icon3: Icons.question_answer,
                        icon4: Icons.question_answer,
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              );
            },
          )),
        ],
      ),
    );
  }
}
