import 'package:ali_nasser_online_coaching_app/config/app_styles.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/assets_manger.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/colors_manger.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/dialog/dialogs.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/email_validation.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/routes_manger.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/strings_manger.dart';
import 'package:ali_nasser_online_coaching_app/database_manger/model/user_dm.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/signup/widgets/custom_text_field.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/widgets/buttons/signup_widget.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/widgets/logo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Signup extends StatefulWidget {
 Signup({super.key});


  @override
  State<Signup> createState() => _SignupState();
}
List<String> genderOptions= ['Male', 'Female'];

class _SignupState extends State<Signup> {

  String currentOption = genderOptions[0];
  bool isMale = true;
  GlobalKey<FormState> validationKey= GlobalKey();
  late TextEditingController fullNameController ;
  late TextEditingController emailController ;
  late TextEditingController passwordController ;
  late TextEditingController rePasswordController ;
  late TextEditingController ageController ;
  late TextEditingController heightController ;
  late TextEditingController weightController ;
  void initState() {
    // TODO: implement initState
    super.initState();
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    rePasswordController = TextEditingController();
    ageController = TextEditingController();
    heightController = TextEditingController();
    weightController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    ageController.dispose();
    heightController.dispose();
    weightController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: validationKey,
        child: Container(
          padding: REdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity.w,
                  height: 35.h,
                ),
                const Logo(),
                SizedBox(height: 5.h,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(StringsManger.signup,style: AppStyles.loginTitle,),
                  ],
                ),
                SizedBox(height: 15.h,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Full Name',style: AppStyles.continueWith,),
                  ],
                ),
                CustomTextField(
                  validator: (input) {
                    if(input == null||input.trim().isEmpty){
                      return 'Please enter Valid Name';
                    }
                    return null;
                  },
                  controller: fullNameController,hintText: 'Enter Your Full Name',keyboardType: TextInputType.text,),
                SizedBox(height: 15.h,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(StringsManger.email,style: AppStyles.continueWith,),
                  ],
                ),
                SizedBox(height: 5.h,),
                CustomTextField(validator: (input) {
                  if(input == null||input.trim().isEmpty){
                    return 'Please fill Your Email';
                  }
                  if(!isValidEmail(input)){
                    return'Enter Valid Email';
                  }
                  return null;
                },controller: emailController,hintText: 'Enter Your Email',keyboardType: TextInputType.emailAddress,),
                SizedBox(height: 15.h,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(StringsManger.password,style: AppStyles.continueWith,),
                  ],
                ),
                SizedBox(height: 5.h,),
                CustomTextField(validator: (input) {
                  if(input == null|| input.trim().isEmpty){
                    return 'Please Enter Valid Password';
                  }
                  return null;

                },hintText: 'Enter Your Password',controller: passwordController,keyboardType: TextInputType.visiblePassword,isSecureText: true,),
                SizedBox(height: 15.h,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Confirm Password',style: AppStyles.continueWith,),
                  ],
                ),
                SizedBox(height: 5.h,),

                CustomTextField(validator: (input) {
                  if(input == null|| input.trim().isEmpty){
                    return 'Please Re-Enter Your Password';
                  }
                  if(input != passwordController.text){
                    return "Password Doesn't Match";
                  }
                  return null;

                },hintText: 'Re-Enter Your Password',controller: rePasswordController,keyboardType: TextInputType.visiblePassword,isSecureText: true,),
                SizedBox(height: 10.h,),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Gender',style: AppStyles.continueWith,),
                  ],
                ),
                ListTile(
                  title: Text('Male',style: AppStyles.enterYourEmail,),
                  leading: Radio(value: genderOptions[0], groupValue: currentOption, onChanged: (value) {
                    setState(() {
                      currentOption = value.toString();
                      isMale = true;
                      print(isMale);

                    });
                  },),
                ),
                ListTile(
                  title: Text('Female',style: AppStyles.enterYourEmail,),
                  leading: Radio(value: genderOptions[1], groupValue: currentOption, onChanged: (value) {
                    setState(() {
                      currentOption = value.toString();
                      isMale = false;
                      print(isMale);

                    });
                  },),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Age',style: AppStyles.continueWith,),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 117.w,
                              child: CustomTextField(validator: (input) {
                                if(input == null|| input.trim().isEmpty|| int.parse(input) < 0 || int.parse(input)> 80){
                                  return 'Please Enter Valid Age';
                                }

                              },hintText: 'Enter Your Age',keyboardType: const TextInputType.numberWithOptions(decimal: false,signed: false),isSecureText: false,controller: ageController,),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Height',style: AppStyles.continueWith,),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 117.w,
                              child: CustomTextField(validator: (input) {
                                if(input == null|| input.trim().isEmpty|| int.parse(input) < 0 || int.parse(input)> 250){
                                  return 'Please Enter Valid Height';
                                }

                              },hintText: 'Enter Your Height',keyboardType: const TextInputType.numberWithOptions(decimal: false,signed: false),isSecureText: false,controller: heightController,),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Weight',style: AppStyles.continueWith,),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 117.w,
                              child: CustomTextField(validator: (input) {
                                if(input == null|| input.trim().isEmpty|| int.parse(input) < 0 || int.parse(input)> 150){
                                  return 'Please Enter Valid Weight';
                                }

                              },hintText: 'Enter Your Weight',keyboardType: const TextInputType.numberWithOptions(decimal: true,signed: false),isSecureText: false,controller: weightController,),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10.h,),

                InkWell(onTap: () {
                  register();
                },child: SignupButton()),

              ],
            ),
          ),
        ),
      ),
    );

  }
  void register()async{
    if(validationKey.currentState?.validate() == false) return;
    try{
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      addUserToFireStore(credential.user!.uid);

    }
    on FirebaseAuthException catch (authError) {

      if (authError.code == 'weak-password') {
        Dialogs.showMassage(context,title: 'weak Password',posActionTitle: 'ok');
      } else if (authError.code == 'email-already-in-use') {
        Dialogs.showMassage(context,title: 'Email already in use',posActionTitle: 'ok');
      }
    } catch (e) {
      print(e);
    }
    Navigator.pushNamed(context, RoutesManger.admin);
  }
  void addUserToFireStore(String userid) async{
    UserDm userDm = UserDm(email: emailController.text, fullName: fullNameController.text,age: int.parse(ageController.text) ,height: int.parse(heightController.text) ,weight: double.parse(weightController.text),gender: isMale,id: userid);
    CollectionReference userCollection = FirebaseFirestore.instance.collection(UserDm.collectionName);
    DocumentReference documentReference = userCollection.doc(userid);
    await documentReference.set(userDm.toFireStore());
  }

  
}
