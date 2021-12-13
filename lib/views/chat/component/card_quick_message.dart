import 'package:buah_tangan_co/themes/font_style.dart';
import 'package:flutter/material.dart';

class CardQuickMessage extends StatelessWidget {
  final String message;
  const CardQuickMessage({required this.message, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(right: 6),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 20,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Text(
        message,
        style: mediumLoraBlackStyle.copyWith(fontSize: 10),
      ),
    );
  }
}
