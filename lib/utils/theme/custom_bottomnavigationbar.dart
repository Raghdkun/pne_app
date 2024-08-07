import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';

class CustomBottomnavigationbar extends StatelessWidget {
  final List<TabItem<dynamic>> items;
  final dynamic Function(int)? onTap;
  final int index;

  const CustomBottomnavigationbar({
    super.key,
   required this.items,
    this.onTap,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: BottomBarInspiredFancy(
        backgroundColor: Colors.white,
        animated: true,
        color: Colors.black,
        colorSelected: Colors.red,
        items: items,
        styleIconFooter: StyleIconFooter.divider,
        pad: 0,
        onTap: onTap,
        iconSize: 30,
        indexSelected: index,
        paddingVertical: 0,
        borderRadius: BorderRadius.circular(20),
        top: 20,
      ),
    );
  }
}
