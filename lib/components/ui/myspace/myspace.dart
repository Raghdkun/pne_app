import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pne_app/components/controllers/myspace/myspace_controller.dart';
import 'package:pne_app/components/ui/myspace/tabs/achievement.dart';
import 'package:pne_app/components/ui/myspace/tabs/goals.dart';
import 'package:pne_app/components/ui/myspace/tabs/people.dart';
import 'package:pne_app/components/ui/myspace/tabs/things.dart';
import 'package:pne_app/utils/theme/curvy_app_bar.dart';

class MySpacePage extends StatelessWidget {
  const MySpacePage({super.key});

  @override
  Widget build(BuildContext context) {
    MySpaceController controller = Get.put(MySpaceController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: CustomScrollView(
        slivers: [
          CurvyAppBar(
            title: "My space",
          ),
          SliverToBoxAdapter(
            child: Container(
              color:
                  Colors.transparent, // Ensures no background color is applied
              padding: const EdgeInsets.symmetric(
                  vertical: 8.0), // Vertical padding for spacing
              child: TabBar(
                tabs: controller.tabsList,
                controller: controller.tabController,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 3.0,
                    color: Colors.red.shade700, // Match the primary theme color
                  ),
                  insets: const EdgeInsets.symmetric(
                      horizontal:
                          16.0), // Add horizontal inset for a clean look
                ),
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                ),
                labelColor: Colors
                    .red.shade700, // Selected tab text color matching the theme
                unselectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 11,
                ),
                unselectedLabelColor:
                    Colors.grey.shade600, // Softer color for unselected tabs
                overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
                  if (states.contains(WidgetState.pressed)) {
                    return Colors.red.shade100
                        .withOpacity(0.2); // Subtle overlay on press
                  } else if (states.contains(WidgetState.hovered)) {
                    return Colors.red.shade100
                        .withOpacity(0.1); // Subtle overlay on hover
                  }
                  return null; // Default overlay behavior
                }),
              ),
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: controller.tabController,
              children: [Goals(), People(), Achievement(), Things()],
            ),
          ),
          // SliverToBoxAdapter(
          //     child: Lottie.asset(trophy, fit: BoxFit.fill, repeat: false)),
          // const SliverToBoxAdapter(
          //   child: Text(
          //     "KEY PERFORMANCE \n INDICATORS",
          //     textAlign: TextAlign.center,
          //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //   ),
          // ),
          // SliverToBoxAdapter(
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Column(
          //       children: [
          //         Container(
          //           width: Get.width / 1.1,
          //           decoration: const BoxDecoration(color: Colors.red),
          //           child: const Text(
          //             "Your Top 5 Goals",
          //             textAlign: TextAlign.center,
          //             style: TextStyle(
          //                 color: Colors.white,
          //                 fontSize: 22,
          //                 fontWeight: FontWeight.bold),
          //           ),
          //         ),
          //         SizedBox(
          //           height: 3.h,
          //         ),
          //         ...List.generate(
          //           5,
          //           (index) => const Column(
          //             children: [
          //               ListTile(
          //                 title: Text("Lorem Ipsum"),
          //                 subtitle: Text(
          //                     "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's"),
          //               ),
          //               Padding(
          //                 padding: EdgeInsets.symmetric(horizontal: 20),
          //                 child: Divider(),
          //               ),
          //             ],
          //           ),
          //         ),
          //         Container(
          //           width: Get.width / 1.1,
          //           decoration: const BoxDecoration(color: Colors.red),
          //           child: const Text(
          //             "",
          //             textAlign: TextAlign.center,
          //             style: TextStyle(
          //                 color: Colors.white,
          //                 fontSize: 22,
          //                 fontWeight: FontWeight.bold),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // SliverToBoxAdapter(
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Column(
          //       children: [
          //         Container(
          //           width: Get.width / 1.1,
          //           decoration: const BoxDecoration(color: Colors.blue),
          //           child: const Text(
          //             "YOUR TOP 5 PEOPLE THAT YOU CAN COUNT ON",
          //             textAlign: TextAlign.center,
          //             style: TextStyle(
          //                 color: Colors.white,
          //                 fontSize: 22,
          //                 fontWeight: FontWeight.bold),
          //           ),
          //         ),
          //         SizedBox(
          //           height: 3.h,
          //         ),
          //         ...List.generate(
          //           5,
          //           (index) => const Column(
          //             children: [
          //               ListTile(
          //                 title: Text("Lorem Ipsum"),
          //                 subtitle: Text(
          //                     "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's"),
          //               ),
          //               Padding(
          //                 padding: EdgeInsets.symmetric(horizontal: 20),
          //                 child: Divider(),
          //               ),
          //             ],
          //           ),
          //         ),
          //         Container(
          //           width: Get.width / 1.1,
          //           decoration: const BoxDecoration(color: Colors.blue),
          //           child: const Text(
          //             "",
          //             textAlign: TextAlign.center,
          //             style: TextStyle(
          //                 color: Colors.white,
          //                 fontSize: 22,
          //                 fontWeight: FontWeight.bold),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // SliverToBoxAdapter(
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Column(
          //       children: [
          //         Container(
          //           width: Get.width / 1.1,
          //           decoration: const BoxDecoration(color: Colors.green),
          //           child: const Text(
          //             "YOUR TOP 5 ACHIEVEMENTS",
          //             textAlign: TextAlign.center,
          //             style: TextStyle(
          //                 color: Colors.white,
          //                 fontSize: 22,
          //                 fontWeight: FontWeight.bold),
          //           ),
          //         ),
          //         SizedBox(
          //           height: 3.h,
          //         ),
          //         ...List.generate(
          //           5,
          //           (index) => const Column(
          //             children: [
          //               ListTile(
          //                 title: Text("Lorem Ipsum"),
          //                 subtitle: Text(
          //                     "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's"),
          //               ),
          //               Padding(
          //                 padding: EdgeInsets.symmetric(horizontal: 20),
          //                 child: Divider(),
          //               ),
          //             ],
          //           ),
          //         ),
          //         Container(
          //           width: Get.width / 1.1,
          //           decoration: const BoxDecoration(color: Colors.green),
          //           child: const Text(
          //             "",
          //             textAlign: TextAlign.center,
          //             style: TextStyle(
          //                 color: Colors.white,
          //                 fontSize: 22,
          //                 fontWeight: FontWeight.bold),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // SliverToBoxAdapter(
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Column(
          //       children: [
          //         Container(
          //           width: Get.width / 1.1,
          //           decoration: const BoxDecoration(color: Colors.purple),
          //           child: const Text(
          //             "YOUR TOP 5 ACHIEVEMENTS ",
          //             textAlign: TextAlign.center,
          //             style: TextStyle(
          //                 color: Colors.white,
          //                 fontSize: 22,
          //                 fontWeight: FontWeight.bold),
          //           ),
          //         ),
          //         SizedBox(
          //           height: 3.h,
          //         ),
          //         ...List.generate(
          //           5,
          //           (index) => const Column(
          //             children: [
          //               ListTile(
          //                 title: Text("Lorem Ipsum"),
          //                 subtitle: Text(
          //                     "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's"),
          //               ),
          //               Padding(
          //                 padding: EdgeInsets.symmetric(horizontal: 20),
          //                 child: Divider(),
          //               ),
          //             ],
          //           ),
          //         ),
          //         Container(
          //           width: Get.width / 1.1,
          //           decoration: const BoxDecoration(color: Colors.purple),
          //           child: const Text(
          //             "",
          //             textAlign: TextAlign.center,
          //             style: TextStyle(
          //                 color: Colors.white,
          //                 fontSize: 22,
          //                 fontWeight: FontWeight.bold),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
