import 'package:buah_tangan_co/model/chat_message.dart';
import 'package:buah_tangan_co/themes/font_style.dart';
import 'package:flutter/material.dart';

class ChatDialog extends StatelessWidget {
  ChatMessage? chatMessage;

  ChatDialog({this.chatMessage, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          (chatMessage!.isReciever) ? Alignment.topRight : Alignment.topLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: (chatMessage!.isReciever)
                ? const Radius.circular(15)
                : const Radius.circular(0),
            bottomLeft: const Radius.circular(15),
            bottomRight: const Radius.circular(15),
            topRight: (chatMessage!.isReciever)
                ? const Radius.circular(0)
                : const Radius.circular(15),
          ),
          color: (chatMessage!.isReciever)
              ? const Color(0xffE09201)
              : Colors.white,
        ),
        child: (chatMessage!.order) ??
            Text(
              chatMessage!.messageContent,
              style: mediumLoraWhiteStyle,
            ),
      ),
    );
  }
}
