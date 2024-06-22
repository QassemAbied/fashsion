import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff676E62),
      appBar: AppBar(
        backgroundColor: Color(0xff676E62),
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back,color: Color(0xffFFFFFF),),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Edit",
                    style: TextStyle(
                      fontSize: 28,
                      color: Color(0xffE9ECF8),decoration: TextDecoration.underline,decorationColor: Color(0xffE9ECF8)
                    ),
                  ),
                  
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "User Name : name",
              style: TextStyle(
                fontSize: 28,
                color: Color(0xffE9ECF8),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Email : abdo@yahoo.com",
              style: TextStyle(
                fontSize: 28,
                color: Color(0xffE9ECF8),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Role : User",
              style: TextStyle(
                fontSize: 28,
                color: Color(0xffE9ECF8),
              ),
            ),
            SizedBox(height: 30,),

            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                onPressed: () {},
                child: Text(
                  "Change Password",
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xff666D61),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
