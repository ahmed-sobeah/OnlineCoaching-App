import 'package:ali_nasser_online_coaching_app/config/app_styles.dart';
import 'package:ali_nasser_online_coaching_app/database_manger/api/model/Food_model/Hints.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/home/tabs/menu/menu_widgets/recipe_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HintsTabWidget extends StatelessWidget {
  HintsTabWidget({super.key,required this.foodList});
  List foodList;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text('Menu',style: AppStyles.title,),
        centerTitle: true,
      ),
      body: Padding(
        padding:  REdgeInsets.all(8.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: ListView.separated(itemBuilder: (context, index) => InkWell(onTap: () {
              },child: RecipeItem(index: index,foodList: [foodList],)), separatorBuilder: (context, index) => SizedBox(height:  20.h), itemCount: foodList.length)),
            ],
          ),
        ),
      ),
    );
  }
}
