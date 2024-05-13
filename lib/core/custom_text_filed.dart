import 'package:fashsion/core/utiles/app_colors.dart';
import 'package:fashsion/core/utiles/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CustomTextFiled{

  static TextFormField textFormField({
    required String hintText,
     String? prefixIcon,
    required TextInputType textInputType,
    required TextEditingController controller,
    String? suffix,
    Function? suffixPressed,
    bool isPassword=false,
}){
    return TextFormField(
      keyboardType: textInputType,
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(

        prefixIcon: prefixIcon !=null? Padding(
          padding: const EdgeInsets.only(left: 20, right: 10),
          child: Image(image: AssetImage(prefixIcon), width: 25,height: 25,),
        ):null,
        suffixIcon:suffix !=null?
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: GestureDetector(
            onTap: (){
              suffixPressed!();
            },
              child: Image(image: AssetImage(suffix), width: 25,height: 25,)),
        ):
        null,
        hintText: hintText,
        hintStyle: AppStyles.styleMedium14(AppColors.greyColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color:  AppColors.greyOpacity ),
        ),
        enabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: AppColors.greyOpacity ),
        ),
        focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color:  AppColors.primaryColor ),
        ),

      ),
    );
  }

}