import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pne_app/components/controllers/profile/profile_controller.dart';

class KpiTabs extends StatelessWidget {
  const KpiTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();

    return SingleChildScrollView(
      child: SizedBox(
        height: 1500.h,
        child: ListView(
          children: [
            // Text(
            //   "KEY PERFORMANCE INDICATORS",
            //   style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            // ),
            SizedBox(
              height: 3.h,
            ),
            ExpandedTile(
                title: Text(
                  "KEY PERFORMANCE INDICATORS",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                content: Column(
                  children: [
                    ...List.generate(
                      controller.kpiList.length,
                      (index) => ListTile(
                        title: Text(
                          "${controller.kpiList[index]['question']}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "${controller.kpiList[index]['answer']}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
                controller: ExpandedTileController()),
                SizedBox(height: 5.h,),
                ExpandedTile(
                title: Text(
                  "Managers Feedback",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                content: Column(
                  children: [
                    ...List.generate(
                      controller.managersFeedback.length,
                      (index) => ListTile(
                        title: Text(
                          "${controller.managersFeedback[index]['field']}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "${controller.managersFeedback[index]['value']}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
                controller: ExpandedTileController())
          ],
        ),
      ),
    );
  }
}
