import 'package:get/get.dart';
import 'package:pne_app/components/controllers/profile/add_role.dart';
import 'package:pne_app/components/ui/auth/forget_password_page.dart';
import 'package:pne_app/components/ui/auth/login_page.dart';
import 'package:pne_app/components/ui/auth/signup_page.dart';
import 'package:pne_app/components/ui/main_page.dart';
import 'package:pne_app/components/ui/profile/role.dart';
import 'package:pne_app/utils/middlewares/auth.dart';
import 'package:pne_app/utils/services/authservice.dart';

class AppRouter {
  static final List<GetPage> routes = [
    GetPage(
      name: '/loading',
      page: () => LoadingScreen(),
      middlewares: [AuthMiddleware()],

    ),
    GetPage(
      name: '/home',
      page: () => const MainPage(),
      // middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: '/login',
      page: () => SignInPage(),
      // middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: '/signup',
      page: () => SignUpPage(),
      // middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: '/forget-password',
      page: () => ForgetPasswordPage(),
    ),
    GetPage(
      name: '/role',
      page: () => RolePage(),
    ),
    GetPage(
      name: '/insert-role',
      page: () => RoleDescriptionForm(),
    ),
  ];
}