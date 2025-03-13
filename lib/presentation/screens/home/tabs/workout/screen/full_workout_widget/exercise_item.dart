import 'package:ali_nasser_online_coaching_app/config/app_styles.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/colors_manger.dart';
import 'package:ali_nasser_online_coaching_app/database_manger/model/workout_dm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExerciseItem extends StatefulWidget {
   ExerciseItem({super.key,required this.workoutDm});
  WorkoutDm workoutDm;

  @override
  State<ExerciseItem> createState() => _ExerciseItemState();
}

class _ExerciseItemState extends State<ExerciseItem> {
  late String thumbnail;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    thumbnail=getYoutubeThumbnail(widget.workoutDm.videoId);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50.h,
          width: 388.w,
          decoration: BoxDecoration(color: Colors.transparent,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 60.h,
                width: 103.w,
                decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(thumbnail),fit: BoxFit.fill),borderRadius: BorderRadius.circular(8.r)),
              ),
              SizedBox(width: 8.w,),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${widget.workoutDm.workoutTitle}",style: AppStyles.date,),
                  Text('Sets X Reps:${widget.workoutDm.sets}X${widget.workoutDm.reps},Duration:${widget.workoutDm.workoutDurationMin}:${widget.workoutDm.workoutDurationSec},Rest:${widget.workoutDm.restMin}:${widget.workoutDm.restSec}',style: AppStyles.enterYourEmail.copyWith(fontSize: 13.sp),),

                ],
              ),


            ],
          ),

        ),
        SizedBox(height: 10.h,),
        Padding(
          padding:  REdgeInsets.only(left: 8.0,right: 8.0),
          child: Divider(height: 2,thickness: 1,color: ColorsManger.grey,),
        )
      ],
    );
  }

   String getYoutubeThumbnail(String videoUrl) {
     final uri = Uri.tryParse(videoUrl);
     if (uri == null) {
       return '';
     }

     return 'https://img.youtube.com/vi/${uri.queryParameters['v']}/0.jpg';
   }
}
