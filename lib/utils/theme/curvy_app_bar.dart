import 'package:flutter/material.dart';

class CurvyAppBar extends StatelessWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final TabBar? tabBar;

  CurvyAppBar({
    required this.title,
    this.leading,
    this.actions,
    this.tabBar,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      floating: false,
      expandedHeight: 90.0,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 20.0), // Further adjustment to move the title up
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        background: Container(
          decoration: BoxDecoration(
            color: Colors.red.shade700,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
        titlePadding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 0.0), // Fine-tune padding
      ),
      leading: leading,
      actions: actions,
      bottom: tabBar,
      backgroundColor: Colors.transparent,
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              CurvyAppBar(
                title: 'My Space',
                leading: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.menu),
                ),
                tabBar: TabBar(
                  tabs: [
                    Tab(text: "Top 5 Goals"),
                    Tab(text: "Top 5 People"),
                    Tab(text: "Top 5 Achievements"),
                  ],
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  labelColor: Colors.red.shade700,
                  unselectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                  unselectedLabelColor: Colors.white.withOpacity(0.7),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelPadding: EdgeInsets.symmetric(horizontal: 16.0),
                ),
              ),
              SliverFillRemaining(
                child: Center(
                  child: Text("Content goes here"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
