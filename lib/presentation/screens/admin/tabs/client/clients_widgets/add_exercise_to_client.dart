
import 'package:ali_nasser_online_coaching_app/config/app_styles.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/colors_manger.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/date_ex/date_ex.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/routes_manger.dart';
import 'package:ali_nasser_online_coaching_app/database_manger/model/exercise_dm.dart';
import 'package:ali_nasser_online_coaching_app/database_manger/model/user_dm.dart';
import 'package:ali_nasser_online_coaching_app/database_manger/model/workout_dm.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/admin/tabs/client/screen/client_details.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/admin/tabs/exercises/exercises_widgets/exercise_item_for_admin.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/signup/widgets/custom_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddExerciseToClient extends StatefulWidget {
   AddExerciseToClient({super.key,required this.id});
String? id;

  @override
  State<AddExerciseToClient> createState() => _AddExerciseToClientState();
   Future show(context){
    return showModalBottomSheet(isScrollControlled: true,context: context, builder: (context) =>Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: AddExerciseToClient(id: id,),
    ));
  }
}

class _AddExerciseToClientState extends State<AddExerciseToClient> {
  DateTime selectedDate =DateTime.now();
  List<ExerciseDm> exerciseList = [];
  TextEditingController setsController =TextEditingController();
  TextEditingController repsController =TextEditingController();
  TextEditingController workoutDurationSecController =TextEditingController();
  TextEditingController workoutDurationMinController =TextEditingController();
  TextEditingController restSecController =TextEditingController();
  TextEditingController restMinController =TextEditingController();
  GlobalKey<FormState> formKey =GlobalKey();
  String videoId = '';
  String workoutTitle = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getExercisesFromFireStore();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height *0.6,
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(child: Text('Select Workout',style: AppStyles.continueWith,)),
            Expanded(
              child: ListView.separated(itemBuilder: (context, index) => InkWell(
                onTap: () {
                  videoId = exerciseList[index].videoId;
                  workoutTitle = exerciseList[index].workoutTitle;
                  print(videoId);
                  print(workoutTitle);
              
                },
                child: ExerciseItemForAdmin(exerciseDm: exerciseList[index],onDeletedTask: (){},index: index,))
              , separatorBuilder: (context, index) => SizedBox(height: 3.h,), itemCount: exerciseList.length),
            ),

            Padding(
              padding:  REdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Sets',style: AppStyles.continueWith.copyWith(fontSize: 10.sp),),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 80.w,
                            child: CustomTextField(validator: (input) {
                              if(int.parse(input!) < 0 || int.parse(input)> 10){
                                return 'Please enter Valid Number';
                              }
                              return null;

                            },hintText: 'Number Of Sets',keyboardType: const TextInputType.numberWithOptions(decimal: false,signed: false),isSecureText: false,controller: setsController,),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Reps',style: AppStyles.continueWith.copyWith(fontSize: 10.sp),),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 80.w,
                            child: CustomTextField(validator: (input) {
                              if(int.parse(input!) < 0 || int.parse(input)> 50){
                                return 'Please enter Valid Number';
                              }
                              return null;

                            },hintText: 'Number Of Reps',keyboardType: const TextInputType.numberWithOptions(decimal: false,signed: false),isSecureText: false,controller: repsController,),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Workout Duration in Min',style:AppStyles.continueWith.copyWith(fontSize: 10.sp),),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 80.w,
                            child: CustomTextField(validator: (input) {
                              if(int.parse(input!) < 0 || int.parse(input)> 60){
                                return 'Please Enter Valid Number';
                              }
                              return null;

                            },hintText: 'Enter A Number',keyboardType: const TextInputType.numberWithOptions(decimal: false,signed: false),isSecureText: false,controller: workoutDurationMinController,),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Workout Duration in Sec',style: AppStyles.continueWith.copyWith(fontSize: 10.sp),),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 80.w,
                            child: CustomTextField(validator: (input) {
                              if(int.parse(input!) < 0 || int.parse(input)> 60){
                                return 'Please Enter Valid Number';
                              }
                              return null;

                            },hintText: 'Enter A Number',keyboardType: const TextInputType.numberWithOptions(decimal: false,signed: false),isSecureText: false,controller: workoutDurationSecController,),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Rest in Min',style: AppStyles.continueWith.copyWith(fontSize: 10.sp),),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 80.w,
                            child: CustomTextField(validator: (input) {
                              if( int.parse(input!) < 0 || int.parse(input)> 150){
                                return 'Please Enter Valid Number';
                              }
                              return null;

                            },hintText: 'Enter A Number',keyboardType: const TextInputType.numberWithOptions(decimal: true,signed: false),isSecureText: false,controller: restMinController,),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Rest in Sec',style: AppStyles.continueWith.copyWith(fontSize: 10.sp),),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 80.w,
                            child: CustomTextField(validator: (input) {
                              if( int.parse(input!) < 0 || int.parse(input)> 150){
                                return 'Please Enter Valid Number';
                              }
                              return null;

                            },hintText: 'Enter A Number',keyboardType: const TextInputType.numberWithOptions(decimal: true,signed: false),isSecureText: false,controller: restSecController,),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text('Select Date',textAlign: TextAlign.start,style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 20),),
            InkWell(onTap: () {
              showTaskDate(context);
            },child: Text(selectedDate.toFormattedDate,textAlign: TextAlign.center,style: AppStyles.enterYourEmail,)),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  addWorkoutToFireStore();
                  setState(() {

                  });
                },
                child: Container(
                    height: 30.h,

                    decoration: BoxDecoration(color: ColorsManger.violet,borderRadius: BorderRadius.circular(20.r)),
                    child: Center(child: Text('Add Workout',style: AppStyles.workoutTitle.copyWith(fontSize: 10.sp),))),
              ),
            ),
          ],
        ),
      ),
    );
  }
  String getYoutubeThumbnail(String videoUrl) {
    final uri = Uri.tryParse(videoUrl);
    if (uri == null) {
      return '';
    }

    return 'https://img.youtube.com/vi/${uri.queryParameters['v']}/0.jpg';
  }

  getExercisesFromFireStore() async{
    CollectionReference exercisesCollection = FirebaseFirestore.instance.collection(ExerciseDm.collectionName);
    QuerySnapshot querySnapshot = await exercisesCollection.get();
    List<QueryDocumentSnapshot> documentsSnapShot = querySnapshot.docs;
    exerciseList = documentsSnapShot.map((docSnapShot) {
      Map<String,dynamic> json = docSnapShot.data() as Map<String,dynamic>  ;
      ExerciseDm exercise =ExerciseDm.fromFireStore(json);
      return exercise;
    } ,).toList();

    setState(() {

    });
  }
  void showTaskDate(context)async{
    selectedDate = await
    showDatePicker(


      context: context,
      firstDate: DateTime.now(),
      initialDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    ) ?? selectedDate;
    print(UserDm.currentUser!.id);
    print(widget.id);
    setState(() {

    });
  }
  void addWorkoutToFireStore(){
    if(formKey.currentState!.validate() == false) return;
    CollectionReference usersCollection =  FirebaseFirestore.instance.collection(UserDm.collectionName);
    CollectionReference workoutCollection = usersCollection.doc(widget.id).collection(WorkoutDm.collectionName);
    DocumentReference documentReference = workoutCollection.doc();
    WorkoutDm workout =WorkoutDm(
      id: documentReference.id,
      videoId: videoId,
      workoutTitle: workoutTitle,
      dateTime: selectedDate,
      sets: int.parse(setsController.text),
      reps: int.parse(repsController.text),
      workoutDurationMin: int.parse(workoutDurationMinController.text),
      workoutDurationSec: int.parse(workoutDurationSecController.text),
      restMin: int.parse(restMinController.text),
      restSec: int.parse(restSecController.text),
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
