import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MySpaceController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  List<Widget> tabsList = [
    Tab(
      text: 'GOALS',
    ),
    Tab(
      text: 'PEOPLE',
    ),
    Tab(
      text: 'ACHIEVEMENTS',
    ),
    Tab(
      text: 'THINGS',
    )
  ];

  @override
  void onInit() {
    tabController = TabController(length: 4, vsync: this);
    super.onInit();
  }
}
