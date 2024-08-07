import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pne_app/utils/constents/svgpaths.dart';
import 'package:pne_app/utils/theme/curvy_app_bar.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CurvyAppBar(title: "My Tasks"),
          SliverFillRemaining(
            hasScrollBody: false,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                children: [
                  SizedBox(
                    height: 95.h,
                    width: 90.w,
                    child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(SvgImages.normal),
                        Text(
                          "ToDo",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
                  ),
                  SizedBox(
                    height: 95.h,
                    width: 90.w,
                    child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          
                      children: [
                        SvgPicture.asset(SvgImages.progress),
                        Text(
                          "In Progress",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
                  ),
                  SizedBox(
                    height: 95.h,
                    width: 90.w,
                    child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        SvgPicture.asset(SvgImages.pending),
                        Text(
                          "Pending",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
                  ),
                  SizedBox(
                    height: 95.h,
                    width: 90.w,
                    child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        SvgPicture.asset(SvgImages.completed),
                        Text(
                          "Completed",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
