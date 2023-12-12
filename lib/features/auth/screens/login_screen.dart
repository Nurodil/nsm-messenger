import 'package:flutter/material.dart';
import 'package:nsm_messenger/common/widget/custom_button.dart';
import 'package:nsm_messenger/widgets/colors.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login_screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: whiteColor, ),
        title: const Text("Sign In"),
        elevation: 0,
        titleTextStyle:const TextStyle(
            color: whiteColor,
            fontSize: 21,
            
          )  
      ),
      body: Container(),
    );
  }
}