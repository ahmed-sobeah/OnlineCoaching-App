import 'package:ali_nasser_online_coaching_app/config/app_styles.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/home/tabs/menu/menu_widgets/recipe_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuTab extends StatelessWidget {
  const MenuTab({super.key});

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
              Expanded(child: ListView.separated(itemBuilder: (context, index) => RecipeItem(), separatorBuilder: (context, index) => SizedBox(height:  20.h), itemCount: 10)),
            ],
          ),
        ),
      ),
    );
  }
}
