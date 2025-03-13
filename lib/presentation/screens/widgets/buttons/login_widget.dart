import 'package:ali_nasser_online_coaching_app/config/app_styles.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/colors_manger.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/strings_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 388.w,
        height: 48.h,
        decoration: BoxDecoration(

            color: ColorsManger.violet,
            borderRadius: BorderRadius.all(Radius.circular(15.r))

        ),
        child: Center(child: Text(StringsManger.login,style: AppStyles.login,)));
  }
}
