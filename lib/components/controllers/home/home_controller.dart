import 'package:awesome_bottom_bar/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pne_app/components/ui/home/home_page.dart';
import 'package:pne_app/components/ui/myspace/myspace.dart';
import 'package:pne_app/components/ui/profile/profile_page.dart';
import 'package:pne_app/components/ui/tasks/task.dart';
import 'package:pne_app/utils/services/authservice.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeController extends GetxController {
  int visit = 0;
  final SupabaseClient supabase = Supabase.instance.client;
  final _isLoggedIn = false.obs;
  final AuthService _authService = Get.find<AuthService>();


  bool get isLoggedIn => _isLoggedIn.value;

  int currentpage = 0;
  List<Widget> listPage = [
    HomePage(),
    ProfilePage(),
    MySpacePage(),
    TaskPage()
  ];

  List<TabItem> items = const [
    TabItem(
      icon: Icons.home,
      title: 'Home',
    ),
    TabItem(
      icon: Icons.person,
      title: 'Profile',
    ),
    TabItem(
      icon: Icons.workspaces,
      title: 'My Space',
    ),
    TabItem(
      icon: Icons.task,
      title: 'Tasks',
    ),
  ];

  Future<void> logout() async {
    await supabase.auth.signOut();
    Get.offAllNamed('/login');

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('session');
    _isLoggedIn.value = false;
    print(" $_isLoggedIn =====> the user logged out");
  }

  changePage(int i) {
    currentpage = i;
    update();
  }
  @override
  void onInit() {
    print("service ===>> ${_authService.isLoggedIn}") ; 
    super.onInit();
  }
}
