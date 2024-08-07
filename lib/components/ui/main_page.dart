import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:pne_app/components/controllers/home/home_controller.dart';
import 'package:pne_app/utils/theme/custom_bottomnavigationbar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
          bottomNavigationBar: CustomBottomnavigationbar(
            index: controller.currentpage,
            items: controller.items,
            onTap: (int index) {
              controller.currentpage = index;
              controller.changePage(index);
            },
          ),
          body: controller.listPage.elementAt(controller.currentpage)),
    );
  }
}
