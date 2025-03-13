import 'package:ali_nasser_online_coaching_app/config/app_styles.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/colors_manger.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/routes_manger.dart';
import 'package:ali_nasser_online_coaching_app/database_manger/model/user_dm.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/admin/tabs/client/clients_widgets/overview_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile',style: AppStyles.title,),
        centerTitle: true,
      ),
      body:Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Row(),
            SizedBox(height:  30.h),
            Container(
              width: 88.w,
              height: 88.w,
              decoration: BoxDecoration(color: ColorsManger.darkGrey,borderRadius: BorderRadius.circular(100.r)),
            ),
            Text('${UserDm.currentUser!.fullName}',style: AppStyles.rememberMe,),
            Text('${UserDm.currentUser!.email}',style: AppStyles.enterYourEmail,),
            SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(


                  children: [
                    Row(
                      children: [
                        Icon(Icons.space_dashboard,color: ColorsManger.violet,),
                        Text('Overview',style: AppStyles.continueWith,)
                      ],
                    ),
                    Row(

                      children: [
                        SizedBox(
                          width: 20.w,
                        ),
                        OverviewItem(title: 'Age', content: '${UserDm.currentUser!.age}'),
                        SizedBox(
                          width: 20.w,
                        ),
                        Container(
                          height: 50.h,
                          width: 2.w,
                          decoration: BoxDecoration(color: ColorsManger.violet,borderRadius: BorderRadius.circular(20.r)),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        OverviewItem(title: 'Weight', content: '${UserDm.currentUser!.weight}'),
                        SizedBox(
                          width: 20.w,
                        ),
                        Container(
                          height: 50.h,
                          width: 2.w,
                          decoration: BoxDecoration(color: ColorsManger.violet,borderRadius: BorderRadius.circular(20.r)),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        OverviewItem(title: 'Height', content: '${UserDm.currentUser!.height}'),

                      ],
                    ),
                  ],
                )
              ],
            ),
            InkWell(
              onTap: () async{
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, RoutesManger.login);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Icon(Icons.logout_rounded,color: ColorsManger.red,size: 20.sp,),
                    SizedBox(width: 5.w,),
                    Text('Logout',style: AppStyles.continueWith,)
                  ],
                ),
              ),
            )
          ],

        ),
      ),
    );
  }
}
