import 'package:ali_nasser_online_coaching_app/config/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
typedef Validator = String? Function(String?);
class CustomTextField extends StatelessWidget {
  CustomTextField({super.key,required this.hintText, this.validator, this.controller,this.isSecureText= false,this.keyboardType = TextInputType.text});
  String hintText;
  Validator? validator;
  TextEditingController? controller;
  bool isSecureText;
  TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: isSecureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        fillColor: Colors.transparent,
        filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(15)
        ),
        hintText: hintText,
        hintStyle: AppStyles.enterYourEmail,
      ),
    );
  }
}
