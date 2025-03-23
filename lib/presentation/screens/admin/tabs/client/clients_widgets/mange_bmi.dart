
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

class MangeBmi extends StatefulWidget {
   MangeBmi({super.key,required this.userDm});
UserDm userDm;

  @override
  State<MangeBmi> createState() => _MangeBmiState();
   Future show(context){
    return showModalBottomSheet(isScrollControlled: true,context: context, builder: (context) =>Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: MangeBmi(userDm: userDm,),
    ));
  }
}

class _MangeBmiState extends State<MangeBmi> {
  TextEditingController caloriesController =TextEditingController();
  TextEditingController proteinController =TextEditingController();
  TextEditingController fatsController =TextEditingController();

  GlobalKey<FormState> formKey =GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height *0.3,
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(child: Text('Set BMI',style: AppStyles.continueWith,)),

            Padding(
              padding:  REdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Calories',style: AppStyles.continueWith.copyWith(fontSize: 10.sp),),
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

                            },hintText: 'Amount Of Calories',keyboardType: const TextInputType.numberWithOptions(decimal: false,signed: false),isSecureText: false,controller: caloriesController,),
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
                          Text('Protein',style: AppStyles.continueWith.copyWith(fontSize: 10.sp),),
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

                            },hintText: 'Amount Of Protein',keyboardType: const TextInputType.numberWithOptions(decimal: false,signed: false),isSecureText: false,controller: proteinController,),
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
                          Text('Fats',style: AppStyles.continueWith.copyWith(fontSize: 10.sp),),
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

                            },hintText: 'Amount of Fats',keyboardType: const TextInputType.numberWithOptions(decimal: false,signed: false),isSecureText: false,controller: fatsController,),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  setBMI(widget.userDm);
                  setState(() {

                  });
                },
                child: Container(
                    height: 30.h,

                    decoration: BoxDecoration(color: ColorsManger.violet,borderRadius: BorderRadius.circular(20.r)),
                    child: Center(child: Text('Finish',style: AppStyles.workoutTitle.copyWith(fontSize: 10.sp),))),
              ),
            ),
          ],
        ),
      ),
    );
  }



  Future<void> setBMI(UserDm userDm) {
    CollectionReference usersCollection =  FirebaseFirestore.instance.collection(UserDm.collectionName);
    DocumentReference documentReference = usersCollection.doc(userDm.id);
    print(documentReference.id);
    return usersCollection
        .doc(documentReference.id)
        .update({'cal' : int.parse(caloriesController.text),
                'protein' : int.parse(proteinController.text),
                'fats':int.parse(fatsController.text),
    })
        .then((value) {
      if(context.mounted){
        Navigator.pop(context);
      }
    },
    )
        .catchError((error) => print("Failed to update user: $error"))
        .timeout(Duration(seconds: 4));
  }
}
