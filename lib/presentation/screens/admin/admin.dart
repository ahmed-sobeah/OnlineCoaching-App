import 'package:ali_nasser_online_coaching_app/core/utils/colors_manger.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/admin/tabs/client/client_management_tab.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/admin/tabs/exercises/exercises_tab.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/admin/tabs/exercises/exercises_widgets/add_new_workout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Admin extends StatefulWidget {
 Admin({super.key});


  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  int selectedIndex=0;
  List<Widget> tabs=[ExercisesTab(),ClientManagementTab()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: buildFab(),
      bottomNavigationBar: BottomNavigationBar(type: BottomNavigationBarType.fixed,elevation: 5,selectedItemColor: ColorsManger.violet,unselectedItemColor: ColorsManger.black,currentIndex: selectedIndex,
        onTap:(index){
          selectedIndex=index;
          setState(() {

          });
        } ,items: [
          BottomNavigationBarItem(icon: Icon(Icons.list),label: 'Exercises List',),
          BottomNavigationBarItem(icon: Icon(Icons.person_pin_outlined), label: 'Clients',),
        ],),
      body: tabs[selectedIndex],


    );
  }
  Widget buildFab () => FloatingActionButton(shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(30.r), side:  BorderSide(color: ColorsManger.white)),
  backgroundColor: ColorsManger.violet,
    onPressed: () async {
      AddNewWorkout.show(context);
      setState(() {

      });
    },child: Icon(Icons.add,color: ColorsManger.white,),);
}
