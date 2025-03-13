import 'package:ali_nasser_online_coaching_app/config/app_styles.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/colors_manger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipeItem extends StatelessWidget {
  const RecipeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.only(right: 20),
      width: 388.w,
      height: 180.h,
      decoration: BoxDecoration(color: ColorsManger.darkGrey,borderRadius: BorderRadius.circular(8.r)),
      child: Text('Smoked Salmon and Mango Salad',style: AppStyles.workoutTitle,),
    );
  }
}
