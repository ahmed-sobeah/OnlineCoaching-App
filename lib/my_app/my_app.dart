import 'package:ali_nasser_online_coaching_app/core/utils/routes_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: const Size(428,926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => const MaterialApp(
        onGenerateRoute: RoutesManger.router,
        initialRoute: RoutesManger.splash,
      ),
    );
  }}