import 'package:ali_nasser_online_coaching_app/config/app_styles.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/routes_manger.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/admin/tabs/exercises/exercises_widgets/exercise_item_for_admin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ali_nasser_online_coaching_app/database_manger/model/exercise_dm.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExercisesTab extends StatefulWidget {
  const ExercisesTab({super.key});

  @override
  State<ExercisesTab> createState() => _ExercisesTabState();
}

class _ExercisesTabState extends State<ExercisesTab> {
  List<ExerciseDm> exerciseList = [];
  Future<void> _refresh(){
    Navigator.pushReplacementNamed(context, RoutesManger.admin);
    return Future.delayed(const Duration(seconds: 1));

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getExercisesFromFireStore();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: InkWell(onTap: () async{
          await FirebaseAuth.instance.signOut();
          Navigator.pushReplacementNamed(context, RoutesManger.login);
        },child: Text('Exercises List',style: AppStyles.title,)),
        centerTitle: true,
      ),
      body: Container(
        padding: REdgeInsets.all(12),
        child: RefreshIndicator(onRefresh: _refresh,child: Column(
          children: [
            Expanded(
              child: ListView.separated(itemBuilder: (context, index) => ExerciseItemForAdmin(index: index,
                  exerciseDm: exerciseList[index],onDeletedTask: (){
                  getExercisesFromFireStore();

                    setState(() {

                    });

              },),
                  separatorBuilder:(context,index) => const SizedBox(height: 20,),
                  itemCount: exerciseList.length),
            ),
          ],
        )),
      ),
    );
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
}
