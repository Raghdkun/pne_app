import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pne_app/components/controllers/home/home_controller.dart';
import 'package:pne_app/utils/theme/curvy_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController()); 
    return Scaffold(
           body: CustomScrollView(
            slivers: [
              CurvyAppBar(title: 'Home',leading: IconButton(onPressed: (){controller.logout(); }, icon: Icon(Icons.logout_outlined)),),
            ],
           ),

    );
  }
}