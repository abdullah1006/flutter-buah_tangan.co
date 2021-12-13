import 'dart:math';

import 'package:buah_tangan_co/model/chat_message.dart';
import 'package:buah_tangan_co/themes/font_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardChat extends StatelessWidget {
  final Message message;
  const CardChat({required this.message, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: Stack(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage(message.urlPhoto!),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      message.sender!,
                      style: boldLoraBlackStyle.copyWith(fontSize: 12),
                    ),
                    Text(
                      message.message!,
                      style: regLoraStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            ],
          ),
          Visibility(
            visible: message.totMessage != 0,
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              height: 24,
              width: 24,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Colors.red[300],
              ),
              child: Text(
                message.totMessage.toString(),
                textAlign: TextAlign.center,
                style: regLoraWhiteStyle.copyWith(fontSize: 12),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Text(
              '09-11-2021 11:24',
              style:
                  GoogleFonts.roboto(fontSize: 10, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
