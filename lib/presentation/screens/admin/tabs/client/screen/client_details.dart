import 'package:ali_nasser_online_coaching_app/config/app_styles.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/colors_manger.dart';
import 'package:ali_nasser_online_coaching_app/database_manger/model/user_dm.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/admin/tabs/client/clients_widgets/add_exercise_to_client.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/admin/tabs/client/clients_widgets/overview_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClientDetails extends StatefulWidget {
  ClientDetails({super.key,required this.userDm});
  UserDm userDm;

  @override
  State<ClientDetails> createState() => _ClientDetailsState();
}

class _ClientDetailsState extends State<ClientDetails> {
  List<UserDm> usersList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getClientDetailsFromFireStore();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Client Details',style: AppStyles.title,) ,
        centerTitle: true,
        iconTheme: IconThemeData(color: ColorsManger.black),
      ),
      body: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [

            SizedBox(height: 20.h,),
            Container(
              width: 100.w,
              height: 100.w,
              decoration: BoxDecoration(color: ColorsManger.darkGrey,shape: BoxShape.circle,border: Border.all(color: ColorsManger.violet,width: 2.w)),


            ),
            Text('${widget.userDm.fullName}',style: AppStyles.title,),
            Text(widget.userDm.gender? 'Male':'Female',style: AppStyles.enterYourEmail,),
            SizedBox(height: 40.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(


                  children: [
                    Row(
                      children: [
                        Icon(Icons.space_dashboard,color: ColorsManger.violet,),
                        Text('Overview',style: AppStyles.continueWith,)
                      ],
                    ),
                    Row(

                      children: [
                        SizedBox(
                          width: 20.w,
                        ),
                        OverviewItem(title: 'Age', content: '${widget.userDm.age}'),
                        SizedBox(
                          width: 20.w,
                        ),
                        Container(
                          height: 50.h,
                          width: 2.w,
                          decoration: BoxDecoration(color: ColorsManger.violet,borderRadius: BorderRadius.circular(20.r)),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        OverviewItem(title: 'Weight', content: '${widget.userDm.weight}'),
                        SizedBox(
                          width: 20.w,
                        ),
                        Container(
                          height: 50.h,
                          width: 2.w,
                          decoration: BoxDecoration(color: ColorsManger.violet,borderRadius: BorderRadius.circular(20.r)),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        OverviewItem(title: 'Height', content: '${widget.userDm.height}'),

                      ],
                    ),
                  ],
                )
              ],
            ),
            Spacer(),
            InkWell(
              onTap: () async {
                AddExerciseToClient(id: widget.userDm.id,).show(context);
                print(widget.userDm.id);
                setState(() {

                });
              },
              child: Container(
                width: 388.w,
                height: 48.h,
                decoration: BoxDecoration(color: ColorsManger.violet,borderRadius: BorderRadius.circular(20.r)),
                child: Center(
                  child: Text('Manage Workout',style: AppStyles.workoutTitle,),
                ),
              ),
            ),
            SizedBox(height: 20.h,),

          ],
        ),
      ),
    );
  }

  getClientDetailsFromFireStore() async{
    CollectionReference clientDetailsCollection = FirebaseFirestore.instance.collection(UserDm.collectionName);
    QuerySnapshot querySnapshot = await clientDetailsCollection.get();
    List<QueryDocumentSnapshot> documentsSnapShot = querySnapshot.docs;
    usersList = documentsSnapShot.map((docSnapShot) {
      Map<String,dynamic> json = docSnapShot.data() as Map<String,dynamic>  ;
      UserDm clientDetails =UserDm.fromFireStore(json);
      return clientDetails;
    } ,).toList();
    usersList = usersList.where((user) => user.id == widget.userDm.id ,).toList();
    setState(() {

    });
  }
}
