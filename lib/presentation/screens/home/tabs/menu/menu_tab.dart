import 'dart:convert';

import 'package:ali_nasser_online_coaching_app/config/app_styles.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/assets_manger.dart';
import 'package:ali_nasser_online_coaching_app/database_manger/api/api_manger/api_manger.dart';
import 'package:ali_nasser_online_coaching_app/database_manger/api/model/Food_model/Food.dart';
import 'package:ali_nasser_online_coaching_app/database_manger/api/model/Food_model/Hints.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/home/tabs/menu/menu_widgets/hints_Tab_widget.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/home/tabs/menu/menu_widgets/recipe_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuTab extends StatefulWidget {
  const MenuTab({super.key});

  @override
  State<MenuTab> createState() => _MenuTabState();
}

class _MenuTabState extends State<MenuTab> {
  List foodList=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readJson();
  }
  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
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
                  Expanded(child: ListView.separated(itemBuilder: (context, index) => RecipeItem(index: index,foodList: foodList,), separatorBuilder: (context, index) => SizedBox(height:  20.h), itemCount: foodList.length)),
                ],
              ),
            ),
          ),
        );
    }



  Future<void> readJson()async{
    final String response = await rootBundle.loadString('${AssetsManger.foodList}');
    final data = await json.decode(response);
    setState(() {
      foodList= data["foodList"];
      print(foodList);
    });
  }
}
