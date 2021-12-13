import 'package:buah_tangan_co/controller/bag_controller.dart';
import 'package:buah_tangan_co/themes/font_style.dart';
import 'package:buah_tangan_co/util/convert_currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CardBagItem extends StatelessWidget {
  final ItemBagModel item;
  const CardBagItem({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bagC = Get.find<BagController>();
    return Column(
      children: [
        Row(
          children: [
            Obx(() => Checkbox(
                  value: bagC.item.value
                      .singleWhere((element) => element.id == item.id)
                      .onCheck,
                  onChanged: (value) => bagC.checkItem(item),
                )),
            const SizedBox(
              width: 10,
            ),
            //Note : Image
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                item.srcGambar,
                height: 54,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Note : Nama dan Harga
                Text(
                  item.nama,
                  style: regLoraBlackStyle.copyWith(fontSize: 14),
                ),
                Text(
                  ConvertCurrency.rpFormating(item.harga),
                  style: boldLoraBlackStyle.copyWith(fontSize: 12),
                )
              ],
            ),
          ],
        ),
        //Note : Counter
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
                onTap: () => bagC.delete(item),
                child: SvgPicture.asset('assets/icons/trash.svg')),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: 90,
              height: 22,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xffC4C4C4),
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => bagC.decrement(item),
                    child: Text(
                      '-',
                      style: mediumLoraBlackStyle.copyWith(fontSize: 14),
                    ),
                  ),
                  Obx(
                    () => Text(
                      bagC.item
                          .singleWhere((element) => element.id == item.id)
                          .jumlah
                          .toString(),
                      style: mediumLoraBlackStyle.copyWith(fontSize: 14),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => bagC.increment(item),
                    child: Text(
                      '+',
                      style: mediumLoraBlackStyle.copyWith(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 30,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              style: regLoraBlackStyle.copyWith(fontSize: 12),
              decoration: InputDecoration(
                label: Text(
                  'Catatan',
                  style: regLoraStyle,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
