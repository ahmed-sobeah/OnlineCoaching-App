import 'package:ali_nasser_online_coaching_app/config/app_styles.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/colors_manger.dart';
import 'package:ali_nasser_online_coaching_app/database_manger/api/model/Food_model/Food.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/signup/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodDetails extends StatefulWidget {
   FoodDetails({super.key,required this.food,required this.index});
  List food;
  int index;

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  late TextEditingController weightController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    weightController = TextEditingController(text: '100');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.food[widget.index]["Food"],style: AppStyles.title,),
        centerTitle: true,
      ),
      body: Padding(
        padding:  REdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
          
              children: [
                Center(
                  child: Container(
                    padding: REdgeInsets.only(right: 20),
                    width: 388.w,
                    height: 100.h,


                  ),
                ),
                SizedBox(height: 20.h,width: double.infinity,),
          
                Text('Nutrients:',style: AppStyles.continueWith,),
                Row(
                  children: [
                    Text("Calories Per 100gm:",style: AppStyles.register,),
                    SizedBox(width: 20.w,),
                    Text('${widget.food[widget.index]["Calories (kcal)"]} Kcal',style: AppStyles.continueWith,)
                  ],
                ),
                Row(
                  children: [
                    Text("Protein Per 100gm:",style:AppStyles.register,),
                    SizedBox(width: 20.w,),
                    Text('${widget.food[widget.index]["Protein (g)"]} gm',style: AppStyles.continueWith,)
                  ],
                ),
                Row(
                  children: [
                    Text("Fats Per 100gm:",style: AppStyles.register,),
                    SizedBox(width: 20.w,),
                    Text('${widget.food[widget.index]["Fats (g)"]} gm',style: AppStyles.continueWith,)
                  ],
                ),
                SizedBox(height: 30.h,),
                Text('Enter Custom weight',style: AppStyles.continueWith,),
                SizedBox(height: 5.h,),
                Padding(
                  padding:  REdgeInsets.all(8.0),
                  child: CustomTextField(hintText: 'Enter In Grams',keyboardType: TextInputType.numberWithOptions(signed: false,decimal: true),controller: weightController,),
                ),
                SizedBox(height: 5.h,),
                Center(
                  child: InkWell(
                    onTap: () {
                        setState(() {
          
                        });
                    },
                    child: Container(
                      width: 388.w,
                      height: 50.h,
                      decoration: BoxDecoration(color: ColorsManger.violet,borderRadius: BorderRadius.circular(20.r)),
                        child: Center(child: Text('Calculate',style:AppStyles.workoutTitle,))),
                  ),
                ),

                buildAnswer(),
                SizedBox(height:  20.h),
                Center(
                  child: InkWell(
                    onTap: () {
          
                      setState(() {
          
                      });
                    },
                    child: Container(
                        width: 388.w,
                        height: 50.h,
                        decoration: BoxDecoration(color: ColorsManger.violet,borderRadius: BorderRadius.circular(20.r)),
                        child: Center(child: Text('Submit',style:AppStyles.workoutTitle,))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget buildAnswer(){
    return  Column(
      children: [
        Row(
          children: [
            Text("Calories:",style: AppStyles.register,),
            SizedBox(width: 20.w,),
            Text('${widget.food[widget.index]["Calories (kcal)"]*(int.parse(weightController.text)*0.01)} Kcal',style: AppStyles.continueWith,)
          ],
        ),
        Row(
          children: [
            Text("Protein:",style:AppStyles.register,),
            SizedBox(width: 20.w,),
            Text('${widget.food[widget.index]["Protein (g)"]*(int.parse(weightController.text)*0.01)} gm',style: AppStyles.continueWith,)
          ],
        ),
        Row(
          children: [
            Text("Fats:",style: AppStyles.register,),
            SizedBox(width: 20.w,),
            Text('${widget.food[widget.index]["Fats (g)"]*(int.parse(weightController.text)*0.01)} gm',style: AppStyles.continueWith,)
          ],
        ),
      ],
    );

  }

}
