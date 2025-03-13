import 'package:ali_nasser_online_coaching_app/config/app_styles.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/colors_manger.dart';
import 'package:ali_nasser_online_coaching_app/database_manger/model/exercise_dm.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/signup/widgets/custom_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNewWorkout extends StatefulWidget {
  AddNewWorkout({super.key,});


  @override
  State<AddNewWorkout> createState() => _AddNewWorkoutState();

  static Future show(context){
    return showModalBottomSheet(isScrollControlled: true,context: context, builder: (context) =>Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: AddNewWorkout(),
    ));
  }
}

class _AddNewWorkoutState extends State<AddNewWorkout> {
  DateTime selectedDate =DateTime.now();
  TextEditingController videoURlController =TextEditingController();
  TextEditingController workoutTitleController =TextEditingController();
  TextEditingController setsController =TextEditingController();
  TextEditingController repsController =TextEditingController();
  TextEditingController workoutDurationSecController =TextEditingController();
  TextEditingController workoutDurationMinController =TextEditingController();
  TextEditingController restSecController =TextEditingController();
  TextEditingController restMinController =TextEditingController();
  GlobalKey<FormState> formKey =GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height *0.4,
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Add New Workout',textAlign: TextAlign.center,style: AppStyles.title,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (input) {
                  if(input == null || input.trim().isEmpty){
                    return 'Please enter a Valid Video URl';
                  }
                  return null;
                },
                controller: videoURlController,
                decoration: InputDecoration(
                  hintText: 'Enter Video URl',
                  hintStyle: AppStyles.enterYourEmail.copyWith(fontSize: 10.sp),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (input) {
                  if(input == null || input.trim().isEmpty){
                    return 'Please enter Workout Title';
                  }
                  return null;
                },
                controller: workoutTitleController,
                decoration: InputDecoration(
                  hintText: 'Enter Your Workout Title',
                  hintStyle: AppStyles.enterYourEmail,
                ),
              ),
            ),

            // Padding(
            //   padding:  REdgeInsets.all(8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [
            //           Row(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Text('Sets',style: AppStyles.continueWith.copyWith(fontSize: 10.sp),),
            //             ],
            //           ),
            //           Row(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               SizedBox(
            //                 width: 80.w,
            //                 child: CustomTextField(validator: (input) {
            //                   if(int.parse(input!) < 0 || int.parse(input)> 10){
            //                     return 'Please enter Valid Number';
            //                   }
            //                   return null;
            //
            //                 },hintText: 'Number Of Sets',keyboardType: const TextInputType.numberWithOptions(decimal: false,signed: false),isSecureText: false,controller: setsController,),
            //               ),
            //             ],
            //           ),
            //           Row(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Text('Reps',style: AppStyles.continueWith.copyWith(fontSize: 10.sp),),
            //             ],
            //           ),
            //           Row(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               SizedBox(
            //                 width: 80.w,
            //                 child: CustomTextField(validator: (input) {
            //                   if(int.parse(input!) < 0 || int.parse(input)> 50){
            //                     return 'Please enter Valid Number';
            //                   }
            //                   return null;
            //
            //                 },hintText: 'Number Of Reps',keyboardType: const TextInputType.numberWithOptions(decimal: false,signed: false),isSecureText: false,controller: repsController,),
            //               ),
            //             ],
            //           ),
            //         ],
            //       ),
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [
            //           Row(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Text('Workout Duration in Min',style:AppStyles.continueWith.copyWith(fontSize: 10.sp),),
            //             ],
            //           ),
            //           Row(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               SizedBox(
            //                 width: 80.w,
            //                 child: CustomTextField(validator: (input) {
            //                   if(int.parse(input!) < 0 || int.parse(input)> 60){
            //                     return 'Please Enter Valid Number';
            //                   }
            //                   return null;
            //
            //                 },hintText: 'Enter A Number',keyboardType: const TextInputType.numberWithOptions(decimal: false,signed: false),isSecureText: false,controller: workoutDurationMinController,),
            //               ),
            //             ],
            //           ),
            //           Row(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Text('Workout Duration in Sec',style: AppStyles.continueWith.copyWith(fontSize: 10.sp),),
            //             ],
            //           ),
            //           Row(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               SizedBox(
            //                 width: 80.w,
            //                 child: CustomTextField(validator: (input) {
            //                   if(int.parse(input!) < 0 || int.parse(input)> 60){
            //                     return 'Please Enter Valid Number';
            //                   }
            //                   return null;
            //
            //                 },hintText: 'Enter A Number',keyboardType: const TextInputType.numberWithOptions(decimal: false,signed: false),isSecureText: false,controller: workoutDurationSecController,),
            //               ),
            //             ],
            //           ),
            //         ],
            //       ),
            //
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [
            //           Row(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Text('Rest in Min',style: AppStyles.continueWith.copyWith(fontSize: 10.sp),),
            //             ],
            //           ),
            //           Row(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               SizedBox(
            //                 width: 80.w,
            //                 child: CustomTextField(validator: (input) {
            //                   if( int.parse(input!) < 0 || int.parse(input)> 150){
            //                     return 'Please Enter Valid Number';
            //                   }
            //
            //                 },hintText: 'Enter A Number',keyboardType: const TextInputType.numberWithOptions(decimal: true,signed: false),isSecureText: false,controller: restMinController,),
            //               ),
            //             ],
            //           ),
            //           Row(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Text('Rest in Sec',style: AppStyles.continueWith.copyWith(fontSize: 10.sp),),
            //             ],
            //           ),
            //           Row(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               SizedBox(
            //                 width: 80.w,
            //                 child: CustomTextField(validator: (input) {
            //                   if( int.parse(input!) < 0 || int.parse(input)> 150){
            //                     return 'Please Enter Valid Number';
            //                   }
            //
            //                 },hintText: 'Enter A Number',keyboardType: const TextInputType.numberWithOptions(decimal: true,signed: false),isSecureText: false,controller: restSecController,),
            //               ),
            //             ],
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  addExerciseToFireStore();
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
  void addExerciseToFireStore(){
    if(formKey.currentState!.validate() == false) return;
    CollectionReference exerciseCollection =  FirebaseFirestore.instance.collection(ExerciseDm.collectionName);
    DocumentReference documentReference = exerciseCollection.doc();
    ExerciseDm exerciseDm =ExerciseDm(id: documentReference.id, videoId: videoURlController.text, 
        workoutTitle: workoutTitleController.text,
    //     sets:int.parse(setsController.text),
    //     reps: int.parse(repsController.text),
    //     workoutDurationMin: int.parse(workoutDurationMinController.text) ,
    //     workoutDurationSec: int.parse(workoutDurationSecController.text),
    // restMin:int.parse(restMinController.text),
    // restSec: int.parse(restSecController.text
        );
    documentReference.set(exerciseDm.toFireStore()).then((value) {
      if(context.mounted){
        Navigator.pop(context);
      }
    },).onError((error, stackTrace) {

    },).timeout(Duration(seconds:  4),
      onTimeout: () {


      },);
  }

  }


