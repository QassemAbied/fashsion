import 'package:fashsion/auth/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/custom_bottons.dart';
import '../core/custom_text_filed.dart';
import '../core/utiles/app_colors.dart';
import '../core/utiles/app_styles.dart';
import '../data/models/sign_in_required_models.dart';
import '../data/models/sign_up_required_models.dart';
import 'manager/auth_cubit.dart';

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
    if(state is SignUpLoading){
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
    if(state is SignUpSuccess){
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
      Navigator.pop(context);

      // Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Successfully',)
      ),
      );
      Future.delayed(const Duration(seconds: 1), (){
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=>LoginView()),
        );
      });
      // Navigator.pushAndRemoveUntil(context,
      //     PageFadeTransition(page:  MainView(currentIndex: 0), duration: 0),
              //(route) => false);
    }
    if(state is SignUpFailure){

      Navigator.pop(context);

      // Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(state.errorMassage,)
      ),
      );
    }
  },
  builder: (context, state) {
    return Column(
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
                        onTap: ()async{
                          await BlocProvider.of<AuthCubit>(context).signUpCubit
                            (context: context, signUpRequired: SignUpRequired(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            password_confirmation: reportPasswordController.text,

                          ),
                          );
                        },
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
        );
  },
),
      ),
    );
}
}
