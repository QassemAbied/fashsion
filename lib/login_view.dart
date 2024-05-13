import 'package:fashsion/core/custom_bottons.dart';
import 'package:fashsion/core/utiles/app_colors.dart';
import 'package:fashsion/core/utiles/app_styles.dart';
import 'package:fashsion/siginup_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'core/custom_text_filed.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final TextEditingController emailController=TextEditingController();

  final TextEditingController passwordController= TextEditingController();

  bool isPassword=true;
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
              height: sizeHeight/3,
              width: sizeWidth/3,
              child: Image(image: AssetImage('assets/images/Layer 1.png'),color: AppColors.witheColor1,),
            ),
            Container(
              height: sizeHeight/1.5,
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
                      hintText: 'Your Email',
                      //prefixIcon: AppImages.emailImage,
                      textInputType: TextInputType.emailAddress,
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextFiled.textFormField(
                        hintText: 'Password',
                        //prefixIcon: AppImages.passwordLockImage,
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
                      height: 20.0,
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal:sizeWidth/4 ),
                      child: CustomButtons.customElevatedButton(
                          onTap: (){},
                          title: 'Sign in',
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextButton(
                        onPressed: (){},
                        child: Text('Forgot password?',
                          style: AppStyles.styleRegular20(AppColors.primaryColor),)
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t Have An Account?',
                          style: AppStyles.styleRegular16(AppColors.primaryColor),),
                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder:(context)=>SignUpView() ));
                        },
                          child:  Text('Sign Up', style: AppStyles.styleRegular16(Color(0xff002984)),),)
                      ],
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
