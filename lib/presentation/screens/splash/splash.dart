import 'dart:async';

import 'package:ali_nasser_online_coaching_app/config/app_styles.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/assets_manger.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/colors_manger.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/routes_manger.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/strings_manger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool trans=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    transform(){
      trans= false;
      setState(() {

      });
    }
    Timer(
      const Duration(seconds: 2),() {
      Navigator.pushReplacementNamed(context, RoutesManger.onBoarding);
    },
    );
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0.1, end: 1.0),
          curve: Curves.ease,
          duration: const Duration(milliseconds: 1500),
          builder: (BuildContext context, double opacity, Widget? child) {
          return Opacity(
          opacity: opacity,child: Image.asset(AssetsManger.frame,width: 156.w,height:69.h ,)
          );}),
            TweenAnimationBuilder<double>(

                tween: Tween<double>(begin: -10, end: 5),
                curve: Curves.ease,
                duration: const Duration(milliseconds: 1500),
                builder: (BuildContext context, double opacity, Widget? child) {
                  return Transform.translate(
                      offset: Offset(0, opacity),

                  child: Text(StringsManger.beFit,style: AppStyles.logo,));}),
          ],
        ),
      ),
    );
  }
}