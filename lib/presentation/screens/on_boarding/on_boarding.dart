
import 'package:ali_nasser_online_coaching_app/config/app_styles.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/assets_manger.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/colors_manger.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/routes_manger.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/strings_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(AssetsManger.onBoardingBg),fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: ColorsManger.darkGrey,
        body: Padding(
          padding:  REdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 510.h,),

              Text(StringsManger.intro,style:AppStyles.intro,),
              SizedBox(height: 40.h,),
              InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, RoutesManger.loginSignup);
                },
                child: Container(
                  width: 388.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: ColorsManger.violet
                  ),
                  child: Center(child: Text('Get Started',style: AppStyles.getStarted,)),

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
