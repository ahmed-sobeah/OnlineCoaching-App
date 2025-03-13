import 'package:ali_nasser_online_coaching_app/config/app_styles.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/colors_manger.dart';
import 'package:ali_nasser_online_coaching_app/database_manger/model/workout_dm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkoutItem extends StatefulWidget {
   WorkoutItem({super.key,required this.workoutDm});
  WorkoutDm workoutDm;

  @override
  State<WorkoutItem> createState() => _WorkoutItemState();
}

class _WorkoutItemState extends State<WorkoutItem> {
  late String thumbnail;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    thumbnail=getYoutubeThumbnail(widget.workoutDm.videoId);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Container(height: 180.h,width: 285.w,decoration: BoxDecoration(
      image: DecorationImage(image: NetworkImage(thumbnail),fit: BoxFit.fill),
      borderRadius: BorderRadius.circular(8.r),

    ),child: Padding(
      padding:  REdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Spacer(),
          Text('${widget.workoutDm.workoutTitle}',style:AppStyles.workoutTitle ,),Text('${widget.workoutDm.sets} X ${widget.workoutDm.reps}',style: AppStyles.workoutTitle,)],
      ),
    ),);
  }

   String getYoutubeThumbnail(String videoUrl) {
     final uri = Uri.tryParse(videoUrl);
     if (uri == null) {
       return '';
     }

     return 'https://img.youtube.com/vi/${uri.queryParameters['v']}/0.jpg';
   }
}
