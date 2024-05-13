import 'package:flutter/material.dart';

import 'core/custom_bottons.dart';
import 'core/custom_text_filed.dart';
import 'core/utiles/app_colors.dart';
import 'core/utiles/app_styles.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {

  final TextEditingController emailController=TextEditingController();


  final TextEditingController nameController=TextEditingController();

  final TextEditingController passwordController= TextEditingController();
  final TextEditingController phoneController= TextEditingController();


  final TextEditingController reportPasswordController= TextEditingController();

  bool isPassword=true;
  bool isRepeatPassword=true;
  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width ;
    double sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              height: sizeHeight/4,
              width: sizeWidth/3,
              child: const Image(image: AssetImage('assets/images/Layer 1.png'),color: AppColors.witheColor1,),
            ),
            Container(
              height: sizeHeight/1,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.witheColor1,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40, ),
                  topLeft: Radius.circular(40, ), ),

              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text('log in', style: AppStyles.styleSemiBold24(AppColors.primaryColor),),

                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextFiled.textFormField(
                      hintText: 'Your Name',
                      //prefixIcon: AppImages.userImage,
                      textInputType: TextInputType.name,
                      controller: nameController,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    CustomTextFiled.textFormField(
                      hintText: 'Your Email',
                     // prefixIcon: AppImages.emailImage,
                      textInputType: TextInputType.emailAddress,
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    CustomTextFiled.textFormField(
                      hintText: 'Phone Number',
                      // prefixIcon: AppImages.emailImage,
                      textInputType: TextInputType.phone,
                      controller: phoneController,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    CustomTextFiled.textFormField(
                        hintText: 'Password',
                       // prefixIcon: AppImages.passwordLockImage,
                        textInputType: TextInputType.visiblePassword,
                        controller: passwordController,
                        isPassword: isPassword,
                        suffix: isPassword? 'assets/images/compo.....eye.png':
                        'assets/images/compo.....eye (1).png',
                        suffixPressed: (){
                          setState(() {
                            isPassword =!isPassword;
                          });
                        }
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    CustomTextFiled.textFormField(
                        hintText: 'Repeat Your Password',
                        //prefixIcon: AppImages.passwordLockImage,
                        textInputType: TextInputType.visiblePassword,
                        controller: reportPasswordController,
                        isPassword: isRepeatPassword,
                        suffix: isRepeatPassword? 'assets/images/compo.....eye.png':
                        'assets/images/compo.....eye (1).png',
                        suffixPressed: (){
                          setState(() {
                            isRepeatPassword =!isRepeatPassword;
                          });
                        }
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal:sizeWidth/4 ),
                      child: CustomButtons.customElevatedButton(
                        onTap: (){},
                        title: 'Next',
                      ),
                    ),

                    const SizedBox(
                      height: 20.0,
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
}
}
