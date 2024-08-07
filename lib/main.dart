import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pne_app/routes/routes.dart';
import 'package:pne_app/utils/services/authservice.dart';
import 'package:pne_app/utils/services/services.dart';
import 'package:pne_app/utils/theme/dark_theme.dart';
import 'package:pne_app/utils/theme/light_theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'utils/constents/supaauth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
    debug: true,
  );
  await initialServices();
  await Get.putAsync<AuthService>(() async => AuthService());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (context, child) {
        return GetMaterialApp(
            getPages: AppRouter.routes,
            debugShowCheckedModeBanner: false,
            darkTheme: darkTheme,
            theme: lightTheme,
            themeMode: ThemeMode.light,
            initialRoute: '/loading',
            home: child);
      },
    );
  }
}
