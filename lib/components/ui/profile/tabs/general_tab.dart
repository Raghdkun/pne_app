import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pne_app/components/controllers/profile/profile_controller.dart';
import 'package:pne_app/components/ui/profile/tabs/widgets/info.dart';
import 'package:pne_app/components/ui/profile/widgets/profile_header.dart';
import 'package:pne_app/utils/constents/appstates.dart';

class GeneralTab extends StatelessWidget {
  final String empName;
  final String empPosition;

  const GeneralTab(
      {super.key, required this.empName, required this.empPosition});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();

    return GetBuilder<ProfileController>(
      builder: (controller) {
        if (controller.appState == AppState.loading) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                color: Colors.red,
              )
            ],
          );
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: 1500.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ProfileHeader(
                  title: controller.username,
                  subTitle: controller.position,
                ),
                SizedBox(height: 15),
                Container(
                  width: Get.width / 1.1,
                  decoration: BoxDecoration(
                      // border: Border.all(),
                      ),
                  child: Card(
                    color: Colors.white,
                    child: Column(
                      children: [
                        ListTile(
                          titleTextStyle: TextStyle(
                              fontSize: 21,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          title: Text("Information"),
                          // trailing: IconButton(
                          //   icon: Icon(Icons.edit),
                          //   onPressed: () {},
                          // ),
                        ),
                        SizedBox(height: 3.h),
                        ListTile(
                          leading: Icon(Icons.person, size: 50),
                          title: Text("Your name"),
                          subtitle: Text("${controller.username}"),
                        ),
                        ListTile(
                          leading: Icon(Icons.email_outlined, size: 50),
                          title: Text("Your email"),
                          subtitle: Text("${controller.userMail}"),
                        ),
                        ListTile(
                          leading: Icon(Icons.account_tree_outlined, size: 50),
                          title: Text("Your Department"),
                          subtitle: Text("${controller.department}"),
                        ),
                        ListTile(
                          leading: Icon(Icons.work_outlined, size: 50),
                          title: Text("Your Position"),
                          subtitle: Text("${controller.position}"),
                        ),
                        SizedBox(height: 10.h),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                InkWell(
                  onTap: () {
                    Get.toNamed("/role");
                  },
                  child: SizedBox(
                    width: Get.width,
                    height: 50.h,
                    child: Card(
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Role Description",
                            style: TextStyle(fontSize: 20),
                            // textAlign: TextAlign.center,
                          ),
                          Icon(
                            Icons.edit,
                            size: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }
}
