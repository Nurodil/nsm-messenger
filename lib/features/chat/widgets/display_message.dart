import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:nsm_messenger/common/enums/message_enum.dart';
import 'package:nsm_messenger/common/utils/colors.dart';
import 'package:nsm_messenger/features/chat/widgets/video_player_item.dart';

class DisplayMessage extends StatelessWidget {
  final String message;
  final MessageEnum type;
  final bool isMyMessage;
  const DisplayMessage({
    Key? key,
    required this.message,
    required this.type,
    required this.isMyMessage
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isPlaying = false;
    final AudioPlayer audioPlayer = AudioPlayer();

    return type == MessageEnum.text
        ? Text(
            message,
            style: TextStyle(
              fontSize: 19,
              color: isMyMessage ? whiteColor : blackColor
            ),
          )
        : type == MessageEnum.audio
            ? StatefulBuilder(builder: (context, setState) {
                return IconButton(
                  constraints: const BoxConstraints(
                    minWidth: 100,
                  ),
                  onPressed: () async {
                    if (isPlaying) {
                      await audioPlayer.pause();
                      setState(() {
                        isPlaying = false;
                      });
                    } else {
                      await audioPlayer.play(UrlSource(message));
                      setState(() {
                        isPlaying = true;
                      });
                    }
                  },
                  icon: Icon(
                    isPlaying ? Icons.pause_circle : Icons.play_circle,
                    color: whiteColor,
                    size: 27,
                  ),
                );
              })
            : type == MessageEnum.video
                ? VideoPlayerItem(
                    videoUrl: message,
                  )
                : CachedNetworkImage(
                        imageUrl: message,
                      );
  }
}
