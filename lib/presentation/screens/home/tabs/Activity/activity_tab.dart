import 'package:ali_nasser_online_coaching_app/config/app_styles.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/colors_manger.dart';
import 'package:ali_nasser_online_coaching_app/database_manger/model/user_dm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivityTab extends StatelessWidget {
  ActivityTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Activity',style: AppStyles.title,),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Container(
                    width: 67.w,
                    height: 20.h,
                    decoration: BoxDecoration(color: ColorsManger.yellow ,borderRadius: BorderRadius.circular(5.r)
                    ),
                    child: Center(child: Text('Calories',style: AppStyles.activityItems,)),
                  ),
                  SizedBox(height: 15.h,),
                  CircularProgressIndicator(
                    color: ColorsManger.yellow,
                    backgroundColor: ColorsManger.grey,
                    value: ((1000*100)/UserDm.currentUser!.cal!)*0.01,
                    strokeAlign: 3,
                    strokeWidth: 5.w,
                  ),
                  SizedBox(height:  20.h),
                  Text('1000/${UserDm.currentUser!.cal}',style: AppStyles.continueWith,)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
