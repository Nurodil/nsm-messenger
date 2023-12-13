import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nsm_messenger/colors.dart';
import 'package:nsm_messenger/features/auth/controller/auth_controller.dart';

class OTPScreen extends ConsumerWidget {
  static const String routeName = "/otp-screen";
  final String verificationId;
  const OTPScreen({super.key, required this.verificationId});

  void verifyOTP(WidgetRef ref, BuildContext context, String userOTP) {
    ref.read(authControllerProvider).verifyOTP(context, verificationId, userOTP);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
         iconTheme: const IconThemeData(color: backgroundColor, ),
        title: const Text("Verifying your number"),
        elevation: 0,
        titleTextStyle:const TextStyle(
            color: backgroundColor,
            fontSize: 21,
          )
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            const Text("We have sent an sms with a code"),
            SizedBox(
              width: size.width,
              child: TextField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: "- - - - - -",
                  hintStyle: TextStyle(
                    fontSize: 29
                  )
                ),
                keyboardType: TextInputType.number,
                onChanged:(val) {
                  if (val.length == 6) {
                    verifyOTP(ref, context, val.trim());
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}