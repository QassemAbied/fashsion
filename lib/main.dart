import 'package:fashsion/data/repo/all_service_provider_repo_impl.dart';
import 'package:fashsion/main_view.dart';
import 'package:fashsion/auth/siginup_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth/manager/auth_cubit.dart';
import 'core/local_network.dart';
import 'core/token.dart';
import 'core/utiles/app_colors.dart';
import 'auth/login_view.dart';
import 'data/manage/all_service_provider_cubit/all_service_provider_cubit.dart';
import 'on_boarding/persentation/view/onboarding_view.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheNetwork.cachedInitialization();
  token= CacheNetwork.getDate(key: 'TOKEN');
  debugPrint(token);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>AuthCubit()),
        BlocProvider(create: (context)=>AllServiceProviderCubit(AllServiceProviderRepoImpl())
          ),
      ],
      child: MaterialApp(
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
        home:token !='' && token != null ? MainView(currentIndex: 0) : const LoginView(),
        //const LoginView(),
       // MainView(currentIndex: 0),
      ),
    );
  }
}

