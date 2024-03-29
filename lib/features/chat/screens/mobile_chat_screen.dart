import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nsm_messenger/common/utils/colors.dart';
import 'package:nsm_messenger/common/widgets/loader.dart';
import 'package:nsm_messenger/features/auth/controller/auth_controller.dart';
import 'package:nsm_messenger/features/chat/widgets/bottom_chat_field.dart';
import 'package:nsm_messenger/models/user_model.dart';
import 'package:nsm_messenger/features/chat/widgets/chat_list.dart';

class MobileChatScreen extends ConsumerWidget {
  static const String routeName = '/mobile-chat-screen';
  final String name;
  final String uid;
  final bool isGroupChat;
  final String? profilePic;
  const MobileChatScreen({
    Key? key,
    required this.name,
    required this.uid,
    required this.isGroupChat,
    required this.profilePic,
  }) : super(key: key);

  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: whiteColor),
          backgroundColor: appBarColor,
          title: isGroupChat
              ? Text(name, 
                style: const TextStyle(
                  fontSize: 20,
                  color: whiteColor,
                ),
              )
              : StreamBuilder<UserModel>(
                  stream: ref.read(authControllerProvider).userDataById(uid),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Loader();
                    }
                    return Column(
                      children: [
                        Text(name,
                          style: const TextStyle(
                          fontSize: 20,
                          color: whiteColor,
                          ),
                        ),
                        Text(
                          snapshot.data!.isOnline ? 'online' : 'offline',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            color: whiteColor,
                          ),
                        ),
                      ],
                    );
                  }),
          centerTitle: false,
        ),
        body: Container(
          color: Color.fromARGB(153, 230, 231, 232),
          child: Column(
            children: [
              Expanded(
                child: ChatList(
                  recieverUserId: uid,
                  isGroupChat: isGroupChat,
                ),
              ),
              BottomChatField(
                recieverUserId: uid,
                isGroupChat: isGroupChat,
              ),
            ],
          ),
        ),
      );
  }
}
