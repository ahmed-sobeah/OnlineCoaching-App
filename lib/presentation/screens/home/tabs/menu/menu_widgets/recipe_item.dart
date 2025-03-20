import 'dart:convert';

import 'package:ali_nasser_online_coaching_app/config/app_styles.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/assets_manger.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/colors_manger.dart';
import 'package:ali_nasser_online_coaching_app/database_manger/api/model/Food_model/Food.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/home/tabs/menu/menu_widgets/food_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipeItem extends StatelessWidget {
  RecipeItem({super.key,required this.index,required this.foodList});
  int index;
  List foodList;

@override
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => FoodDetails(food: foodList,index: index,),));
      },
      child: Container(
        padding: REdgeInsets.only(right: 20),
        width: 388.w,
        height: 180.h,
        decoration: BoxDecoration(color: ColorsManger.darkGrey,borderRadius: BorderRadius.circular(8.r),image: DecorationImage(image: NetworkImage('https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=600'),fit: BoxFit.fill)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 140.h,),
            Text('${foodList[index]["Food"]}',style: AppStyles.title,),
          ],
        ),
      ),
    );
  }
}
