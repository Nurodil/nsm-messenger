import 'package:flutter/material.dart';
import 'package:nsm_messenger/common/widget/error.dart';
import 'package:nsm_messenger/features/auth/screens/login_screen.dart';
import 'package:nsm_messenger/features/auth/screens/otp_screen.dart';
import 'package:nsm_messenger/features/auth/screens/user_information_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings)  {
  switch (settings.name) {
    case LoginScreen.routeName:
      return  MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );
    
    case OTPScreen.routeName:
      final verificationId = settings.arguments as String;
      return  MaterialPageRoute(
        builder: (context) => OTPScreen(verificationId: verificationId,),
    );

    case UserInformationScreen.routeName:
      return  MaterialPageRoute(
        builder: (context) => const UserInformationScreen(),
    );

    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: ErrorScreen(error: "The page doesn't found"),
        ),

      );
  }
}