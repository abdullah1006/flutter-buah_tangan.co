import 'package:buah_tangan_co/controller/ordering_controller.dart';
import 'package:buah_tangan_co/themes/font_style.dart';
import 'package:buah_tangan_co/util/convert_currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CardButtonKirim extends StatelessWidget {
  final List<String> listType;
  final List<int> listHarga;
  const CardButtonKirim(
      {required this.listHarga, required this.listType, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderC = Get.find<OrderingController>();
    return ListView.separated(
        cacheExtent: 0,
        shrinkWrap: true,
        primary: false,
        itemBuilder: (context, index) => ListTile(
              minVerticalPadding: 0,
              onTap: () {
                Get.back();
                orderC.pengiriman.value = listType[index];
              },
              dense: true,
              title: Text(
                listType[index],
                style: boldLoraBlackStyle.copyWith(fontSize: 14),
              ),
              subtitle: Text(
                ConvertCurrency.rpFormating(listHarga[index]),
                style: regLoraBlackStyle.copyWith(fontSize: 14),
              ),
            ),
        separatorBuilder: (context, index) => Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 5,
              color: const Color(0xffF0F0F0),
            ),
        itemCount: listType.length);
  }
}
