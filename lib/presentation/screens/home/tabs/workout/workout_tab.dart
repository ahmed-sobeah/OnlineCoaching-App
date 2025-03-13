import 'package:ali_nasser_online_coaching_app/config/app_styles.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/assets_manger.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/colors_manger.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/date_ex/date_ex.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/routes_manger.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/strings_manger.dart';
import 'package:ali_nasser_online_coaching_app/database_manger/model/user_dm.dart';
import 'package:ali_nasser_online_coaching_app/database_manger/model/workout_dm.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/home/tabs/workout/screen/full_workout.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/home/tabs/workout/screen/workout_details.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/home/tabs/workout/workout_widgets/exercises_for_you_item.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/home/tabs/workout/workout_widgets/week_item.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/home/tabs/workout/workout_widgets/workout_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkoutTab extends StatefulWidget {
  const WorkoutTab({super.key});

  @override
  State<WorkoutTab> createState() => _WorkoutTabState();
}

class _WorkoutTabState extends State<WorkoutTab> {
  DateTime selectedDate = DateTime.now();
  List<WorkoutDm> workoutList=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWorkoutFromFireStore();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(StringsManger.workoutTitle,style: AppStyles.title,),
      ),
      body: Padding(
        padding: REdgeInsets.all(8.0),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20.h,),
                InkWell(onTap:() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FullWorkout(selectedDate: selectedDate),));
                },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Today's Workout",style: AppStyles.title ,),

                      Text('View All',style: AppStyles.enterYourEmail,)
                    ],
                  ),
                ),
                SizedBox(height: 5.h,),
                SizedBox(
                  height:180.h ,
                  width: double.infinity,
                  child: ListView.separated(separatorBuilder: (context, index) =>  SizedBox(width: 20.w,),scrollDirection: Axis.horizontal,itemCount: workoutList.length,itemBuilder: (context, index) {
                    return InkWell(onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => WorkoutDetails(workoutDm: workoutList[index]),));
                    },child: WorkoutItem(workoutDm: workoutList[index],));
                  },),
                ),
                SizedBox(height: 30.h,),
                Text("This Week WorkOuts",style:AppStyles.title,),
                SizedBox(height: 10.h,),
                buildCalender(),
                SizedBox(height: 30.h,),
                Text("Exercises For You",style: AppStyles.title,),
                SizedBox(height: 10.h,),
                SizedBox(
                  height: 458,
                  width: double.infinity,
                  child: ListView.separated(itemBuilder: (context, index) {
                    return InkWell(onTap: () {
                      Navigator.pushNamed(context, RoutesManger.workoutDetails);
                    },child: ExercisesForYouItem());
                  }, separatorBuilder:(context,index)=> SizedBox(height:16.h ), itemCount: 15),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCalender(){
  return  DatePicker(DateTime.now(),dateTextStyle: AppStyles.date,dayTextStyle:AppStyles.date,monthTextStyle: AppStyles.date, daysCount: 7,initialSelectedDate: selectedDate,height: 100.h,width: 70.w,selectionColor: ColorsManger.violet,onDateChange: (selectedDatee) {
    selectedDate=selectedDatee;
    print(selectedDate.toString());
    print(selectedDatee.toString());
    getWorkoutFromFireStore();
    setState(() {

    });
    Navigator.push(context, MaterialPageRoute(builder: (context) => FullWorkout(selectedDate: selectedDate),));
  },);
    
}
  getWorkoutFromFireStore() async{
    CollectionReference workoutCollection = FirebaseFirestore.instance.collection(UserDm.collectionName).doc(UserDm.currentUser!.id).collection(WorkoutDm.collectionName);
    QuerySnapshot querySnapshot = await workoutCollection.get();
    List<QueryDocumentSnapshot> documentsSnapShot = querySnapshot.docs;
    workoutList = documentsSnapShot.map((docSnapShot) {
      Map<String,dynamic> json = docSnapShot.data() as Map<String,dynamic>  ;
      WorkoutDm workoutDm =WorkoutDm.fromFireStore(json);
      return workoutDm;
    } ,).toList();
    workoutList = workoutList.where((workoutDm) => workoutDm.dateTime.month == selectedDate.month && workoutDm.dateTime.day == selectedDate.day && workoutDm.dateTime.year == selectedDate.year ,).toList();
    setState(() {

    });
  }
}
