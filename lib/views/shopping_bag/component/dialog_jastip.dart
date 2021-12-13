import 'package:buah_tangan_co/controller/bag_controller.dart';
import 'package:buah_tangan_co/themes/font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DialogJastip extends StatelessWidget {
  const DialogJastip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bagC = Get.find<BagController>();
    return AlertDialog(
      title: Text(
        'Link Jastip Anda',
        style: boldLoraBlackStyle.copyWith(fontSize: 20),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Silahkan copy dan share link jastip anda ke teman anda',
            style: regLoraBlackStyle,
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: TextFormField(
                    enabled: false,
                    style: regLoraBlackStyle,
                    controller: bagC.jastipC,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () => bagC.copyText(),
                icon: const Icon(Icons.copy),
              ),
            ],
          )
        ],
      ),
    );
  }
}
