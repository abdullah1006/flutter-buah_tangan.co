import 'package:buah_tangan_co/controller/bag_controller.dart';
import 'package:buah_tangan_co/themes/font_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'card_bag_item.dart';

class CardBagShop extends StatelessWidget {
  const CardBagShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bagC = Get.find<BagController>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Obx(() => Checkbox(
                    value: bagC.checkAll.value,
                    onChanged: (value) => bagC.setCheckAll(),
                  )),
              RichText(
                text: TextSpan(
                    text: 'OlehOlehOfficial',
                    style: boldLoraBlackStyle.copyWith(fontSize: 14),
                    children: [
                      TextSpan(
                        text: '\nKota Gresik',
                        style: regLoraBlackStyle.copyWith(fontSize: 12),
                      )
                    ]),
              ),
            ],
          ),
        ),

        //Note : Card Barang per Toko
        Obx(() => ListView.separated(
              shrinkWrap: true,
              primary: false,
              itemCount: bagC.item.length,
              padding: const EdgeInsets.symmetric(vertical: 10),
              separatorBuilder: (context, index) {
                if (index == bagC.item.length - 1) {
                  return const SizedBox();
                }
                return Container(
                  height: 1,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  color: const Color(0xffF0F0F0),
                );
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CardBagItem(item: bagC.item[index]),
                );
              },
            )),
      ],
    );
  }
}
