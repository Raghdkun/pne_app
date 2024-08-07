import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Info extends StatelessWidget {
  final String? mainTitle;
  final String? firstTitle;
  final String? secTitle;
  final String? thirdTitle;
  final String? forthTitle;
  final String? sub1;
  final String? sub2;
  final String? sub3;
  final String? sub4;
  final IconData? icon1;
  final IconData? icon2;
  final IconData? icon3;
  final IconData? icon4;
  final void Function()? onPressed;

  const Info(
      {super.key,
      this.mainTitle,
      this.firstTitle,
      this.secTitle,
      this.thirdTitle,
      this.forthTitle,
      this.sub1,
      this.sub2,
      this.sub3,
      this.sub4,
      this.icon1,
      this.icon2,
      this.icon3,
      this.icon4,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width / 1.1,
      // height: Get.height,
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
              title: Text(mainTitle!),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: onPressed,
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            ListTile(
              title: ExpandedTile(
                title: Text(
                  firstTitle!,
                  style: TextStyle(fontSize: 16),
                ),
                content: Text(sub1!),
                leading: Icon(
                  icon1!,
                  size: 40,
                ),
                controller: ExpandedTileController(),
              ),
            ),
            ListTile(
              title: ExpandedTile(
                title: Text(
                  secTitle!,
                  style: TextStyle(fontSize: 16),
                ),
                content: Text(sub2!),
                leading: Icon(
                  icon2!,
                  size: 40,
                ),
                controller: ExpandedTileController(),
              ),
            ),
            ListTile(
              title: ExpandedTile(
                title: Text(
                  thirdTitle!,
                  style: TextStyle(fontSize: 16),
                ),
                content: Text(sub3!),
                leading: Icon(
                  icon3!,
                  size: 40,
                ),
                controller: ExpandedTileController(),
              ),
            ),
            ListTile(
              title: ExpandedTile(
                title: Text(
                  forthTitle!,
                  style: TextStyle(fontSize: 16),
                ),
                content: Text(sub4!),
                leading: Icon(
                  icon4!,
                  size: 40,
                ),
                controller: ExpandedTileController(),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
