import 'package:fashsion/auth/manager/auth_cubit.dart';
import 'package:fashsion/core/custom_bottons.dart';
import 'package:fashsion/core/utiles/app_colors.dart';
import 'package:fashsion/core/utiles/app_styles.dart';
import 'package:fashsion/auth/siginup_view.dart';
import 'package:fashsion/main_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/custom_text_filed.dart';
import '../data/models/sign_in_required_models.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final TextEditingController emailController=TextEditingController();

  final TextEditingController passwordController= TextEditingController();

  bool isPassword=true;
  bool absorbing=false;
  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width ;
    double sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: BlocConsumer<AuthCubit, AuthState>(
  listener: (context, state)async {
    if(state is SignInLoading){
      await   showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AbsorbPointer(
          absorbing: absorbing,
          child: const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          ),
        );
      },);
    }
    if(state is SignInSuccess){
      //Navigator.pop(context);
      // CustomDialog.dialogWidget(
      //     context: context,
      //     image: AppImages.successImage,
      //     title: 'Account successfully created'
      // );
      // Future.delayed(const Duration(seconds: 1), (){
      //   Navigator.pop(context);
      //   Navigator.pushAndRemoveUntil(
      //     context,
      //     PageFadeTransition(page: MainView(currentIndex: 0,), duration: 0)
      //   );
      // });

      // CustomDialog.dialogWidget(
      //     context: context,
      //     image: AppImages.successImage,
      //     title: 'Account successfully created'
      // ).then((value) {
      //   Navigator.push(
      //     context,
      //     PageFadeTransition(page: const SignInView(), duration: 0),
      //   );
      // });

      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context)=>MainView(currentIndex: 0)),
              (route) => false);
    }
    if(state is SignInFailure){


      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(state.errorMassage, )
      ),
      );
    }
  },
  builder: (context, state) {
    return Column(
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
                          onTap: ()async{
                            await BlocProvider.of<AuthCubit>(context).signInCubit(
                              context: context,
                              signInRequired: SignInRequired(
                                  email: emailController.text,
                                  password: passwordController.text),
                            );
                          },
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
        );
  },
),
      ),
    );
  }
}
