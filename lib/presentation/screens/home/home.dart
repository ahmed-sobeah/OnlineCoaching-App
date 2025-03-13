
import 'package:ali_nasser_online_coaching_app/core/utils/assets_manger.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/colors_manger.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/home/tabs/Activity/activity_tab.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/home/tabs/menu/menu_tab.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/home/tabs/profile/profile_tab.dart';

import 'package:ali_nasser_online_coaching_app/presentation/screens/home/tabs/workout/workout_tab.dart';

import 'package:flutter/material.dart';


class Home extends StatefulWidget {
 Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

 int selectedIndex=0;
 List<Widget> tabs=[WorkoutTab(),ActivityTab(),MenuTab(),ProfileTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(type: BottomNavigationBarType.fixed,elevation: 5,selectedItemColor: ColorsManger.violet,unselectedItemColor: ColorsManger.black,currentIndex: selectedIndex,
        onTap:(index){
          selectedIndex=index;
          setState(() {

          });
        } ,items: [
          BottomNavigationBarItem(icon: ImageIcon(AssetImage(AssetsManger.workoutIcon)),label: 'Workout',),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage(AssetsManger.activityIcon)),
            label: 'Activity',),

          BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu),label: 'Menu'),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),
        ],),
      body: tabs[selectedIndex],


    );

  }
}
