import 'package:ali_nasser_online_coaching_app/config/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OverviewItem extends StatelessWidget {
   OverviewItem({super.key,required this.title, required this.content});
   String title;
   String content;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text('$title',style: AppStyles.date,),
            SizedBox(height:  10.h),
            Text('$content',style: AppStyles.date.copyWith(fontWeight: FontWeight.w300),)
          ],
        )
      ],
    );
  }
}
