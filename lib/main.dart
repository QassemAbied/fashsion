import 'package:fashsion/main_view.dart';
import 'package:fashsion/siginup_view.dart';
import 'package:flutter/material.dart';

import 'core/utiles/app_colors.dart';
import 'login_view.dart';
import 'on_boarding/persentation/view/onboarding_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              maximumSize: const Size(double.infinity,60),
              minimumSize: const Size(double.infinity, 50),
              backgroundColor: AppColors.primaryColor,
              // disabledBackgroundColor: AppColors.primaryColor,
              foregroundColor: AppColors.witheColor,
              // disabledForegroundColor: AppColors.blackColor,
              elevation: 2.0,
              surfaceTintColor: AppColors.primaryColor,
              animationDuration: const Duration(milliseconds: 150),
              // textStyle: AppStyles.styleBold20(AppColors.witheColor),
              padding: const EdgeInsets.only(top: 10, bottom: 10,)
          ),
        ),
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MainView(currentIndex: 0),
    );
  }
}

