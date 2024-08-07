import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends GetxService {
  final SupabaseClient supabase = Supabase.instance.client;
  final _isLoggedIn = false.obs;
  final _isInitialized = false.obs;

  bool get isLoggedIn => _isLoggedIn.value;
  bool isInitialized() => _isInitialized.value;
  

  @override
  void onInit() {
    super.onInit();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final session = supabase.auth.currentSession;
    if (session != null) {
      _isLoggedIn.value = true;
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? refreshToken = prefs.getString('refresh_token');
      if (refreshToken != null) {
        final response = await supabase.auth.setSession(refreshToken);
        if (response.session != null) {
          _isLoggedIn.value = true;
        }
      }
    }
    _isInitialized.value = true; // Mark initialization as complete
  }

  Future<void> login(String email, String password) async {
    final response = await supabase.auth.signInWithPassword(email: email, password: password);
    if (response.user != null) {
      _isLoggedIn.value = true;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('refresh_token', response.session?.refreshToken ?? '');
    }
  }

  Future<void> logout() async {
    await supabase.auth.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('refresh_token');
    _isLoggedIn.value = false;
  }
}



class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
