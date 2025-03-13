import 'package:ali_nasser_online_coaching_app/config/app_styles.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/assets_manger.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/colors_manger.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/routes_manger.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/strings_manger.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/widgets/buttons/continue_with_facebook.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/widgets/buttons/continue_with_google.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/widgets/buttons/login_widget.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/widgets/buttons/signup_widget.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginSignup extends StatelessWidget {
  const LoginSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
        
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity.w,
              height: 125.h,
            ),
            const Logo(),
             SizedBox(height: 100.h,),
             InkWell(onTap: () {
               Navigator.pushReplacementNamed(context, RoutesManger.login);
             },child: LoginButton()),
             SizedBox(height: 20.h,),
             InkWell(onTap: () {
               Navigator.pushReplacementNamed(context, RoutesManger.signup);
             },child: SignupButton()),
            SizedBox(height: 40.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 1.h,
                  width: 176.5.w,
                  decoration: BoxDecoration(color: ColorsManger.grey),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                  child: Text('OR',style: GoogleFonts.poppins(color: ColorsManger.grey,fontSize: 16.sp,fontWeight: FontWeight.w400),),
                ),
                Container(
                  height: 1.h,
                  width: 176.5.w,
                  decoration: BoxDecoration(color: ColorsManger.grey),
                ),
              ],
            ),
            SizedBox(height: 40.h,),
            ContinueWithGoogle(),
            SizedBox(height: 20.h,),
            ContinueWithFacebook()
        
          ],
        ),
      ),
    );
  }
}
