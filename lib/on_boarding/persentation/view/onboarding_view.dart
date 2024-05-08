import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:fashsion/core/utiles/app_colors.dart';
import 'package:fashsion/core/utiles/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../data/models/onboarding_models.dart';

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
                  Center(
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
                      if (isLast) {
                        pageController.nextPage(
                            duration: Duration(milliseconds: 750),
                            curve: Curves.slowMiddle);
                      } else {}
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
                          SizedBox(
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
                  // SizedBox(
                  //   height: 20,
                  // ),
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
                  Expanded(child: SizedBox()),
                ],
              ),
            ),
          ),



         // Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
