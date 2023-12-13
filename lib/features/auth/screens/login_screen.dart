import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nsm_messenger/common/utils/utils.dart';
import 'package:nsm_messenger/common/widget/custom_button.dart';
import 'package:nsm_messenger/colors.dart';
import 'package:nsm_messenger/features/auth/controller/auth_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeName = '/login_screen';
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final phoneController = TextEditingController();
  Country? country;
  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  void pickCountry() {
    showCountryPicker(
      context: context, 
      onSelect: (Country _country) {
        setState(() {
          country = _country;
        });
      });
  }

  void sendPhoneNumber(){
    String phoneNumber = phoneController.text.trim();
    if (country != null && phoneNumber.isNotEmpty) {
      ref.read(authControllerProvider)
      .signInWithPhone(context, "+${country!.phoneCode}$phoneNumber");
    }
    else {
      showSnackBar(context: context, content: "Fill out all the field");
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: backgroundColor, ),
        title: const Text("Enter your phone number"),
        elevation: 0,
        titleTextStyle:const TextStyle(
            color: backgroundColor,
            fontSize: 21,
            
          )  
      ),
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Column(
          children: [
            const Text("NSM Messenger will need to verify your phone number",
            style: TextStyle(
              fontSize: 15
            ),),
            const SizedBox(height: 9,),
            TextButton(
              onPressed: pickCountry, 
              child: const Text("Pick Country")
            ),
            const SizedBox(height: 5,),
            Row(
              children: [
                if(country != null) 
                Text("+${country!.phoneCode}"),
                const SizedBox(width: 10,),
                SizedBox(
                  width: size.width * 0.75,
                  child: TextField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                      hintText: "phone number",
                    ),
                    keyboardType: TextInputType.phone,
                    
                  ),
                ),
        
              ],
            ),
            
            SizedBox(height: size.height*0.2,),
            SizedBox(
              width: 115,
              child: CustomButton(
                onPressed: sendPhoneNumber,
                text: "NEXT",
              ),
            )
        ]),
      ),
    );
  }
}