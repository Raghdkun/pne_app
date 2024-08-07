import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pne_app/utils/constents/lottiepaths.dart';

class People extends StatelessWidget {
  const People({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Lottie.asset(people, fit: BoxFit.fill, repeat: true, width: 500),
            SizedBox(
              height: 20.h,
            ),
            Container(
              width: Get.width / 1.1,
              decoration: const BoxDecoration(color: Colors.blue),
              child: const Text(
                "YOUR TOP 5 PEOPLE THAT YOU CAN COUNT ON",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            ...List.generate(
              5,
              (index) => const Column(
                children: [
                  ListTile(
                    title: Text("Lorem Ipsum"),
                    subtitle: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(),
                  ),
                ],
              ),
            ),
            Container(
              width: Get.width / 1.1,
              decoration: const BoxDecoration(color: Colors.blue),
              child: const Text(
                "",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
