import 'package:ali_nasser_online_coaching_app/config/app_styles.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/colors_manger.dart';
import 'package:ali_nasser_online_coaching_app/database_manger/model/user_dm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClientItem extends StatefulWidget {
 ClientItem({super.key,required this.userDm});
 UserDm userDm;

  @override
  State<ClientItem> createState() => _ClientItemState();
}

class _ClientItemState extends State<ClientItem> {
  @override
  Widget build(BuildContext context) {
    return Container(height: 180.h,width: 285.w,decoration: BoxDecoration(
      color: ColorsManger.darkGrey,
      borderRadius: BorderRadius.circular(8.r),

    ),child: Padding(
      padding:  REdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Spacer(),
          Text('${widget.userDm.fullName}',style:AppStyles.workoutTitle ,),
          Text('Weight:${widget.userDm.weight} Height: ${widget.userDm.height} Age: ${widget.userDm.age}',style: AppStyles.workoutTitle,)],
      ),
    ),);;
  }
}
