import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:fashsion/core/utiles/app_colors.dart';
import 'package:fashsion/core/utiles/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../data/models/onboarding_models.dart';
import '../../../chose_login.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController pageController = PageController();
  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,

      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Container(
            height: 700,
            decoration:  BoxDecoration(
              color: Colors.white,
                borderRadius:BorderRadius.circular(40)
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 50, right: 15, left: 15),
              child: Column(
                children: [
                  const Center(
                      child: Image(
                        image: AssetImage('assets/images/Layer 1.png'),
                        width: 100,
                        height: 80,
                      )),
                  ExpandablePageView(
                    //  physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    controller: pageController,

                    animationDuration: const Duration(
                      milliseconds: 750,
                    ),
                    animationCurve: Curves.slowMiddle,
                    onPageChanged: (index) {
                      // if (isLast) {
                      //   pageController.nextPage(
                      //       duration: const Duration(milliseconds: 750),
                      //       curve: Curves.slowMiddle);
                      // } else {}
                      if(index == onBoardingList.length -1){
                        setState(() {
                          isLast=true;
                        });
                        pageController.nextPage(
                            duration: const Duration(milliseconds: 750),
                            curve: Curves.slowMiddle);
                      }else{
                        setState(() {
                          isLast=false;
                        });
                      }

                    },
                    children: List.generate(onBoardingList.length, (index) {
                      return Column(
                        children: [
                          Image(
                            image: AssetImage(onBoardingList[index].image),
                            width: 350,
                            height: 370,
                          ),
                          Text(
                            onBoardingList[index].title,
                            style: AppStyles.styleBold24(AppColors.primaryColor),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            onBoardingList[index].subTitle,
                            style: AppStyles.styleLight14(AppColors.primaryColor),
                          ),
                        ],
                      );
                    }),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SmoothPageIndicator(
                    controller: pageController,
                    count: onBoardingList.length,
                    axisDirection: Axis.horizontal,
                    effect: ExpandingDotsEffect(
                        spacing: 2.0,
                        radius: 8.0,
                        dotWidth: 15.0,
                        dotHeight: 15.0,
                        expansionFactor: 1.1,
                        dotColor: AppColors.primaryColor.withOpacity(0.30),
                        activeDotColor: AppColors.primaryColor),
                  ),
                  const Expanded(child: SizedBox()),
                ],
              ),
            ),
          ),
         Padding(
           padding: const EdgeInsets.only(top: 10, right: 15,left: 15),
           child: Row(
             children: [
               Flexible(
                 flex: 1,
                 child: ElevatedButton(
                     onPressed: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>ChoseLogin()));
                     },
                     child: Text('Skip',
                       style: AppStyles.styleMedium18(AppColors.witheColor1,),)),
               ),
               const SizedBox(
                 width: 50,
               ),
               Flexible(
                 flex: 1,
                 child: ElevatedButton(
                     style: ElevatedButton.styleFrom(
                         maximumSize: const Size(double.infinity,60),
                         minimumSize: const Size(double.infinity, 50),
                         backgroundColor: AppColors.witheColor1,
                         // disabledBackgroundColor: AppColors.primaryColor,
                         foregroundColor: AppColors.witheColor1,
                         // disabledForegroundColor: AppColors.blackColor,
                         elevation: 2.0,
                         surfaceTintColor: AppColors.witheColor1,
                         animationDuration: const Duration(milliseconds: 150),
                         // textStyle: AppStyles.styleBold20(AppColors.witheColor),
                         padding: const EdgeInsets.only(top: 10, bottom: 10,)
                     ),
                     onPressed: (){
                       if(isLast){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>ChoseLogin()));
                       }else{
                         pageController.nextPage(
                             duration: const Duration(milliseconds: 750),
                             curve: Curves.fastLinearToSlowEaseIn
                         );
                       }
                     },
                     child: Text(isLast? 'Start':'Next',
                       style: AppStyles.styleMedium18(AppColors.blackColor,),)),
               ),
             ],
           ),
         ),



         // Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
