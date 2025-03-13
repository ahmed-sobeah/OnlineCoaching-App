import 'package:ali_nasser_online_coaching_app/config/app_styles.dart';
import 'package:ali_nasser_online_coaching_app/database_manger/model/exercise_dm.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class ExerciseItemForAdmin extends StatefulWidget {
   ExerciseItemForAdmin({super.key,required this.exerciseDm,this.onDeletedTask,required this.index});
   ExerciseDm exerciseDm;
   Function? onDeletedTask;
   int index;

  @override
  State<ExerciseItemForAdmin> createState() => _ExerciseItemForAdminState();
}

class _ExerciseItemForAdminState extends State<ExerciseItemForAdmin> {
  late String thumbnail;


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    thumbnail = getYoutubeThumbnail(widget.exerciseDm.videoId);
  }
  @override
  Widget build(BuildContext context) {

    return Slidable(
      startActionPane: ActionPane(motion:const BehindMotion(), children: [
        SlidableAction(
          borderRadius:const BorderRadius.only(
            topLeft: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          ),
          flex: 2,
          onPressed: (context)  {

            deleteTodoFromFireStore(widget.exerciseDm);
            widget.onDeletedTask!();

          },
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'Delete',
        ),
      ]),
      child: Container(height: 180.h,width: 285.w,decoration: BoxDecoration(image: DecorationImage(image: NetworkImage('$thumbnail'),fit: BoxFit.fill),
        borderRadius: BorderRadius.circular(8.r),
      
      ),child: Padding(
        padding:  REdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(),
            Text('${widget.exerciseDm.workoutTitle}',style:AppStyles.workoutTitle ,),
            ],
        ),
      ),),
    );
  }
  String getYoutubeThumbnail(String videoUrl) {
    final uri = Uri.tryParse(videoUrl);
    if (uri == null) {
      return '';
    }

    return 'https://img.youtube.com/vi/${uri.queryParameters['v']}/0.jpg';
  }
  void deleteTodoFromFireStore(ExerciseDm exerciseDm) async{
    CollectionReference exerciseReference = FirebaseFirestore.instance.collection(ExerciseDm.collectionName);
    DocumentReference exerciseDoc = exerciseReference.doc(exerciseDm.id);
    await exerciseDoc.delete();


  }
}
