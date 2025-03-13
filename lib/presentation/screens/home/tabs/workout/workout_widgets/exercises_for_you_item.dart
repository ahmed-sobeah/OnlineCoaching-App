import 'package:ali_nasser_online_coaching_app/config/app_styles.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExercisesForYouItem extends StatelessWidget {
  const ExercisesForYouItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 388.w,
      decoration: BoxDecoration(color: Colors.transparent,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 60.h,
            width: 103.w,
            decoration: BoxDecoration(color: ColorsManger.darkGrey,borderRadius: BorderRadius.circular(8.r)),
          ),
          SizedBox(width: 5.w,),

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Running",style: AppStyles.date,),
              Text('30 Min'),
            ],
          ),
          Spacer(),
          Text('280 kacl',style: AppStyles.signup,)

        ],
      ),

    );
  }
}
