import 'package:ali_nasser_online_coaching_app/config/app_styles.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/assets_manger.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/colors_manger.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/dialog/dialogs.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/email_validation.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/routes_manger.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/strings_manger.dart';
import 'package:ali_nasser_online_coaching_app/database_manger/model/user_dm.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/signup/widgets/custom_text_field.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/widgets/buttons/continue_with_facebook.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/widgets/buttons/continue_with_google.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/widgets/buttons/login_widget.dart';
import 'package:ali_nasser_online_coaching_app/presentation/screens/widgets/logo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
   const Login({super.key});

  @override
  State<Login> createState() => _LoginState();

}


class _LoginState extends State<Login> {
  GlobalKey<FormState> validationKey= GlobalKey();

  late TextEditingController emailController ;

  late TextEditingController passwordController ;
  bool rememberMeValue = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    emailController.dispose();
    passwordController.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: REdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity.w,
                height: 65.h,
              ),
              const Logo(),
              SizedBox(height: 37.h,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(StringsManger.login,style: AppStyles.loginTitle,),
                ],
              ),
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
              },hintText: StringsManger.enterYourEmail,controller: emailController,keyboardType: TextInputType.emailAddress,isSecureText: false,),
              SizedBox(height: 15.h,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(StringsManger.password,style: AppStyles.continueWith,),
                ],
              ),
              SizedBox(height: 5.h,),
              CustomTextField(validator: (input) {
                if(input == null||input.trim().isEmpty){
                  return 'Please Enter Your Password';
                }
                return null;
              },hintText: StringsManger.password,controller: passwordController,keyboardType: TextInputType.text,isSecureText: true,),

              SizedBox(height: 15.h,),
              Row(
                children: [
                  Checkbox(activeColor: ColorsManger.violet,shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.r))),value: rememberMeValue, onChanged: (value) {
                    setState(() {
                      rememberMeValue = value!;
                    });
          
                  },),
          
                  Text('Remember me',style: AppStyles.continueWith,),
                  Spacer(),
                  Text('Forgot password?',style: AppStyles.enterYourEmail,)
                ],
              ),
              SizedBox(height: 15.h,),
              InkWell(onTap: () {
                login();
              },child: LoginButton()),
              SizedBox(height: 18.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?",style:AppStyles.enterYourEmail,),
                  SizedBox(width: 2.w,),
                  InkWell(onTap: () {
                    Navigator.pushReplacementNamed(context, RoutesManger.signup);
                  },child: Text('Register',style: AppStyles.register,))
                ],
              )
          
          
            ],
          ),
        ),
      ),
    );
  }
  void login()async{
    if(validationKey.currentState?.validate() == false) return;
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text

      );
      UserDm.currentUser = await readUserFromFireStore(credential.user!.uid);
      if(UserDm.currentUser!.id== "35HR8LyJuyLlmF8JYtXDtccwvun1"){
        Navigator.pushReplacementNamed(context, RoutesManger.admin);
      }else {
        Navigator.pushReplacementNamed(context, RoutesManger.home);
      }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Dialogs.showMassage(context,title: 'User Not Found',posActionTitle: 'ok');
      } else if (e.code == 'wrong-password') {
        Dialogs.showMassage(context,title: 'Wrong Password',posActionTitle: 'ok');
      }
    }
  }
  Future <UserDm> readUserFromFireStore(String userId) async{
    CollectionReference userCollection = FirebaseFirestore.instance.collection(UserDm.collectionName);
    DocumentReference userDocument = userCollection.doc(userId);
    DocumentSnapshot userDocSnapShot = await userDocument.get();
    Map<String,dynamic> json = userDocSnapShot.data() as Map<String, dynamic>;
    UserDm userDm= UserDm.fromFireStore(json);
    return userDm;
  }
}
