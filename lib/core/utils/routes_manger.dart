

import 'package:ali_nasser_online_coaching_app/presentation/screens/admin/admin.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/admin/tabs/client/screen/client_details.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/home/home.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/home/tabs/workout/screen/full_workout.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/home/tabs/workout/screen/workout_details.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/login/login.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/login_signup/login_signup.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/on_boarding/on_boarding.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/signup/signup.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/splash/splash.dart';
import 'package:flutter/material.dart';


class RoutesManger{
  static const String splash ='/splash';
  static const String home ='/home';
  static const String onBoarding ='/onboarding';
  static const String loginSignup ='/loginSignup';
  static const String login ='/login';
  static const String signup ='/signup';
  static const String fullWorkout ='/fullWorkout';
  static const String workoutDetails ='/workoutDetails';
  static const String admin ='/admin';
  static const String clientDetails ='/clientDetails';

  static Route? router(RouteSettings settings){
    switch(settings.name){
      case splash:
        return MaterialPageRoute(builder: (context) => const Splash(),);
      case home:
        return MaterialPageRoute(builder: (context) =>   Home(),);
      case onBoarding:
        return MaterialPageRoute(builder: (context) => const OnBoarding(),);
      case loginSignup:
        return MaterialPageRoute(builder: (context) => const LoginSignup(),);
      case login:
        return MaterialPageRoute(builder: (context) =>  Login(),);
      case signup:
        return MaterialPageRoute(builder: (context) => Signup(),);
      case admin:
        return MaterialPageRoute(builder: (context) => Admin(),);

    }

  }
}