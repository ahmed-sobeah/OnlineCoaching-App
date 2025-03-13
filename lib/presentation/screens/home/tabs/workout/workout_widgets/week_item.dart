import 'package:ali_nasser_online_coaching_app/config/app_styles.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/colors_manger.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/routes_manger.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class WeekItem extends StatelessWidget {
  const WeekItem({super.key});

  @override
  Widget build(BuildContext context) {
    return DatePicker(DateTime.now(),dateTextStyle: AppStyles.date,dayTextStyle:AppStyles.date,monthTextStyle: AppStyles.date, daysCount: 7,initialSelectedDate: DateTime.now(),height: 100.h,width: 70.w,selectionColor: ColorsManger.violet,onDateChange: (selectedDate) {
      Navigator.pushNamed(context, RoutesManger.fullWorkout);
    },);
  }
}
