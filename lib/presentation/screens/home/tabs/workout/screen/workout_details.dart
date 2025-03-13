import 'package:ali_nasser_online_coaching_app/config/app_styles.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/colors_manger.dart';
import 'package:ali_nasser_online_coaching_app/database_manger/model/workout_dm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:youtube_player_iframe/youtube_player_iframe.dart';


class WorkoutDetails extends StatefulWidget {
  WorkoutDetails({super.key,required this.workoutDm});
  WorkoutDm workoutDm;


  @override
  State<WorkoutDetails> createState() => _WorkoutDetailsState();
}

class _WorkoutDetailsState extends State<WorkoutDetails> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = YoutubePlayerController(
      params: const  YoutubePlayerParams(

        showControls: true,
        mute: true,
        showFullscreenButton: true,
        loop: false,
        strictRelatedVideos: false,
        enableJavaScript: true,

      )

    )..loadVideo(widget.workoutDm.videoId);

    }
    @override
  void dispose() {
    // TODO: implement dispose
      _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Details',style: AppStyles.title,),
        centerTitle: true,
        iconTheme: IconThemeData(color: ColorsManger.black),
      ),
      body: Padding(
        padding: REdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 388.w,
              height: 180.h,
              decoration: BoxDecoration(color: ColorsManger.darkGrey,borderRadius: BorderRadius.circular(8.r)),
              child:  YoutubePlayer(controller: _controller,),
            ),
            Text('${widget.workoutDm.workoutTitle}',style: AppStyles.title,),
            Text('Sets X Reps',style: AppStyles.continueWith,),
            Text("${widget.workoutDm.sets} X ${widget.workoutDm.reps}"),
            Text('Workout Duration',style: AppStyles.continueWith,),
            Text("${widget.workoutDm.workoutDurationMin}:${widget.workoutDm.workoutDurationSec}"),
            Text('Rest',style: AppStyles.continueWith,),
            Text("${widget.workoutDm.restMin}:${widget.workoutDm.restSec}"),
          ],
        ),
      ),
    );
  }


}
