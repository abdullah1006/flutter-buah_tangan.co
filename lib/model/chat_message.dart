import 'package:buah_tangan_co/themes/font_style.dart';
import 'package:flutter/widgets.dart';

class ChatMessage {
  Widget? order;
  String messageContent;
  bool isReciever;
  ChatMessage({this.order, this.messageContent = '', required this.isReciever});
}

class Message {
  String? message;
  String? urlPhoto;
  String? sender;
  int totMessage;

  Message({
    required this.message,
    required this.sender,
    required this.urlPhoto,
    this.totMessage = 0,
  });
}
