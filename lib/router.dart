import 'package:flutter/material.dart';
import 'package:nsm_messenger/common/widgets/error.dart';
import 'package:nsm_messenger/features/auth/screens/login_screen.dart';
import 'package:nsm_messenger/features/auth/screens/otp_screen.dart';
import 'package:nsm_messenger/features/auth/screens/user_information_screen.dart';
import 'package:nsm_messenger/features/chat/screens/mobile_chat_screen.dart';
import 'package:nsm_messenger/features/group/screens/create_group_screen.dart';
import 'package:nsm_messenger/features/select_contacts/screens/select_contacts_screen.dart';
import 'package:nsm_messenger/screens/mobile_layout_screen.dart';

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
    
    case MobileChatScreen.routeName:
      final arguments = settings.arguments as Map<String, dynamic>;
      final name = arguments['name'];
      final uid = arguments['uid'];
      final isGroupChat =  arguments['isGroupChat'];
      final profilePic = arguments['profilePic'];
      print(arguments);
      return MaterialPageRoute(
        builder: (context) => MobileChatScreen(
          name: name,
          uid: uid,
          isGroupChat: isGroupChat,
          profilePic: profilePic,
        ),
      );

    case SelectContactsScreen.routeName:
      return  MaterialPageRoute(
        builder: (context) => const SelectContactsScreen(),
    );

    case CreateGroupScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const CreateGroupScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: ErrorScreen(error: "The page doesn't found"),
        ),

      );
  }
}