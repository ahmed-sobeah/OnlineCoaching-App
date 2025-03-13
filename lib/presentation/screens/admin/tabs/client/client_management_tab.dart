import 'package:ali_nasser_online_coaching_app/database_manger/model/user_dm.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/admin/tabs/client/clients_widgets/client_item.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/admin/tabs/client/screen/client_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClientManagementTab extends StatefulWidget {
  const ClientManagementTab({super.key});

  @override
  State<ClientManagementTab> createState() => _ClientManagementTabState();
}

class _ClientManagementTabState extends State<ClientManagementTab> {
  List<UserDm> usersList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getClientsFromFireStore();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(12),
      child: Column(
        children: [
          Expanded(child: ListView.separated(
              itemBuilder: (context, index) => InkWell(onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => ClientDetails(userDm: usersList[index]),) );
              },child: ClientItem(userDm: usersList[index])),
              separatorBuilder:(context,index) => SizedBox(height: 20,),
              itemCount: usersList.length))
        ],
      ),
    );
  }


  getClientsFromFireStore() async{
    CollectionReference clientsCollection = FirebaseFirestore.instance.collection(UserDm.collectionName);
    QuerySnapshot querySnapshot = await clientsCollection.get();
    List<QueryDocumentSnapshot> documentsSnapShot = querySnapshot.docs;
    usersList = documentsSnapShot.map((docSnapShot) {
      Map<String,dynamic> json = docSnapShot.data() as Map<String,dynamic>  ;
      UserDm exercise =UserDm.fromFireStore(json);
      return exercise;
    } ,).toList();

    setState(() {

    });
  }
}
