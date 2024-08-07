import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pne_app/utils/services/authservice.dart';
import 'package:pne_app/utils/services/services.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;
  // int? get priority => 1;
  final AuthService _authService = Get.find<AuthService>();
  MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    // Wait until the AuthService is fully initialized

    if (myServices.sharedPreferences.getString("session") != null ) {
      return const RouteSettings(name: '/home');
    } else {
      return const RouteSettings(name: '/login');
    }
  }
}
