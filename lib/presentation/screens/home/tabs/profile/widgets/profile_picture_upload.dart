import 'dart:io';

import 'package:ali_nasser_online_coaching_app/config/app_styles.dart';
import 'package:ali_nasser_online_coaching_app/core/utils/colors_manger.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePictureUpload extends StatefulWidget {
  const ProfilePictureUpload({super.key});

  @override
  State<ProfilePictureUpload> createState() => _ProfilePictureUploadState();
}

class _ProfilePictureUploadState extends State<ProfilePictureUpload> {
  PlatformFile? pickedFile;
  Future selectfile() async{
    final result = await FilePicker.platform.pickFiles();
    if (result ==null) return;
    setState(() {
      pickedFile = result.files.first;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Profile Pic.',style:  AppStyles.title,),
        centerTitle: true,
      ),
      body:Column(

        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 300.h,
            width: 150.w,
            decoration: BoxDecoration(color: ColorsManger.grey,image: DecorationImage(image: FileImage(File(
              pickedFile != null? pickedFile!.path!: ''
            )),fit: BoxFit.fitHeight)),
          ),
          InkWell(
            onTap: () {
              selectfile();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50.h,
                width: 120.w,
                decoration: BoxDecoration(color: ColorsManger.violet,borderRadius: BorderRadius.circular(5.r)),
                child: Center(child: Text('Select Image',style: AppStyles.workoutTitle,)),
              ),
            ),
          ),
          SizedBox(height: 10.h,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50.h,
              width: 120.w,
              decoration: BoxDecoration(color: ColorsManger.violet,borderRadius: BorderRadius.circular(5.r)),
              child: Center(child: Text('Confirm',style: AppStyles.workoutTitle,)),
            ),
          ),
        ],
      ),
    );
  }


}
