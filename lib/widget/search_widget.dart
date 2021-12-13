import 'package:buah_tangan_co/themes/font_style.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final VoidCallback onPressed;
  final ValueChanged<String>? onChanged;
  final Color color;
  const SearchWidget({
    this.color = const Color(0xffD3d3d3),
    this.hintText = '',
    required this.controller,
    this.onChanged,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 37,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
      ),
      child: TextField(
        //textAlignVertical: TextAlignVertical.center,
        controller: controller,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 3),
            prefixIcon: const Icon(Icons.search),
            hintText: hintText,
            border: InputBorder.none,
            hintStyle: regLoraStyle),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.search,
        onChanged: onChanged,
        onEditingComplete: onPressed,
      ),
    );
  }
}
