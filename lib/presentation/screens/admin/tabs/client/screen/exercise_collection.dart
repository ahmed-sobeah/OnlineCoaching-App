import 'package:ali_nasser_online_coaching_app/config/app_styles.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/colors_manger.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/routes_manger.dart';
import 'package:ali_nasser_online_coaching_app/database_manger/model/user_dm.dart';
import 'package:ali_nasser_online_coaching_app/database_manger/model/workout_dm.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/home/tabs/workout/screen/full_workout_widget/exercise_item.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/home/tabs/workout/screen/workout_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExerciseCollection extends StatefulWidget {
  ExerciseCollection({super.key,required this.selectedDate,required this.userDm});
  UserDm userDm;
  DateTime selectedDate;

  @override
  State<ExerciseCollection> createState() => _ExerciseCollectionState();
}


class _ExerciseCollectionState extends State<ExerciseCollection> {
  DateTime assignDate = DateTime.now();
  List<WorkoutDm> workoutList=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWorkoutFromFireStore();

  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h,),
        Expanded(
          child: Stack(
            children: [
              Scaffold(
                appBar: AppBar(
                  backgroundColor: ColorsManger.black,
                ),
                body: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 250.h,),
                      Text('Workouts of The Day:',style: AppStyles.title,),
                      SizedBox(height: 20.h,),
                      Expanded(child: ListView.separated(itemBuilder: (context, index) => InkWell(onTap: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => WorkoutDetails(workoutDm: workoutList[index]),) );
                      },child: ExerciseItem(workoutDm: workoutList[index],)), separatorBuilder: (context, index) => SizedBox(height: 20.h,), itemCount: workoutList.length)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            showTaskDate(context);
                            print(workoutList[0].restSec);
                          },
                          child: Container(
                            width: 388.w,
                            height: 48.h,
                            decoration: BoxDecoration(color: ColorsManger.violet,borderRadius: BorderRadius.circular(20.r)),
                            child: Center(
                              child: Text('Assign Workout',style: AppStyles.workoutTitle,),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      width: 428.w,
                      height: 277.h,
                      decoration: BoxDecoration(image: DecorationImage(image: NetworkImage('https://www.puregym.com/media/sqflb0zc/bodyweight.jpg?quality=80'),fit: BoxFit.fill))),


                ],
              ),

              BackButton(color: ColorsManger.white,),


            ],
          ),
        ),



      ],
    );
  }

  getWorkoutFromFireStore() async{
    CollectionReference workoutCollection = FirebaseFirestore.instance.collection(UserDm.collectionName).doc(widget.userDm.id).collection(WorkoutDm.collectionName);
    QuerySnapshot querySnapshot = await workoutCollection.get();
    List<QueryDocumentSnapshot> documentsSnapShot = querySnapshot.docs;
    workoutList = documentsSnapShot.map((docSnapShot) {
      Map<String,dynamic> json = docSnapShot.data() as Map<String,dynamic>  ;
      WorkoutDm workoutDm =WorkoutDm.fromFireStore(json);
      return workoutDm;
    } ,).toList();
    workoutList = workoutList.where((workoutDm) => workoutDm.dateTime.month == widget.selectedDate.month && workoutDm.dateTime.day == widget.selectedDate.day && workoutDm.dateTime.year == widget.selectedDate.year ,).toList();
    setState(() {

    });
  }
  void showTaskDate(context)async{
    assignDate = await
    showDatePicker(


      context: context,
      firstDate: DateTime.now(),
      initialDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    ) ?? assignDate;


    setState(() {
      for(int i = 0;i < workoutList.length;i++){
        addWorkoutToFireStore(i);
      }



    });

  }
  void addWorkoutToFireStore(int index){
    CollectionReference usersCollection =  FirebaseFirestore.instance.collection(UserDm.collectionName);
    CollectionReference workoutCollection = usersCollection.doc(widget.userDm.id).collection(WorkoutDm.collectionName);
    DocumentReference documentReference = workoutCollection.doc();
    WorkoutDm workout =WorkoutDm(
      id: documentReference.id,
      videoId: workoutList[index].videoId,
      workoutTitle: workoutList[index].workoutTitle,
      dateTime: assignDate,
      sets: workoutList[index].sets,
      reps: workoutList[index].reps,
      workoutDurationMin: workoutList[index].workoutDurationMin,
      workoutDurationSec: workoutList[index].workoutDurationSec,
      restMin: workoutList[index].restMin,
      restSec: workoutList[index].restSec,
    );
    documentReference.set(workout.toFireStore()).then((value) {
      if(context.mounted){
        Navigator.pop(context);
      }
    },).onError((error, stackTrace) {

    },).timeout(Duration(seconds:  4),
      onTimeout: () {


      },);
  }
}