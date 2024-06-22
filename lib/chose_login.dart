import 'package:fashsion/core/custom_bottons.dart';
import 'package:fashsion/core/utiles/app_colors.dart';
import 'package:fashsion/auth/login_view.dart';
import 'package:fashsion/auth/siginup_view.dart';
import 'package:flutter/material.dart';

class ChoseLogin extends StatelessWidget {
  const ChoseLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff676E62),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child:

              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>LoginView() ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.witheColor1,
                ),

                child:const Text(
                  "LOG IN",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Color(0xff676E62)),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:(context)=>SignUpView() ));
              },
              style: ElevatedButton.styleFrom(
                side: BorderSide(color: AppColors.witheColor1, width: 2.0),
              ),
              // style: ElevatedButton.styleFrom(minimumSize: Size(327, 78),
              //   //primary: Color(0xff676E62),
              //   side:const BorderSide(
              //     width: 2,
              //     color: Color(0xffFFFFFF),
              //
              //   ),
             // ),
              child:const Text(
                "SIN UP",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Color(0xffFFFFFF)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
