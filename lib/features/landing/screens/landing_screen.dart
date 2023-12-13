import 'package:flutter/material.dart';
import 'package:nsm_messenger/common/widgets/custom_button.dart';
import 'package:nsm_messenger/features/auth/screens/login_screen.dart';
import 'package:nsm_messenger/common/utils/colors.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  void navigateToLoginScreen(BuildContext context) {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50,),
            const Text("Welcome to NSM Messenger",
            style: TextStyle(fontSize: 27),
            ),
            SizedBox(height: size.height/9,),
            Image.asset("assets/NSM.png",
              height: 375,
              width: 375,
            ),
            SizedBox(height: size.height/13,),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text("Read Privacy Policy and Please Tap \"Agree and continue\" Button.",
              style: TextStyle(
                color: greyColor
              ),
              textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: size.width * 0.75,
              child: CustomButton(text: "AGREE AND CONTINUE",onPressed: ()=> navigateToLoginScreen(context),),
            ),

          ],
        )
        ),
    );
  }
}