import 'package:buah_tangan_co/controller/bag_controller.dart';
import 'package:buah_tangan_co/themes/font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CardBagItem extends StatelessWidget {
  const CardBagItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bagC = Get.find<BagController>();
    return Column(
      children: [
        Row(
          children: [
            Obx(() => Checkbox(
                  value: bagC.checkAll.value,
                  onChanged: (value) => bagC.setCheckAll(),
                )),
            const SizedBox(
              width: 10,
            ),
            //Note : Image
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                'assets/images/nasi_krawu.png',
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
                  'Nasi Krawu',
                  style: regLoraBlackStyle.copyWith(fontSize: 14),
                ),
                Text(
                  'Rp. 10.000',
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
            SvgPicture.asset('assets/icons/trash.svg'),
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
                  Text(
                    '-',
                    style: mediumLoraBlackStyle.copyWith(fontSize: 14),
                  ),
                  Text(
                    '1',
                    style: mediumLoraBlackStyle.copyWith(fontSize: 14),
                  ),
                  Text('+', style: mediumLoraBlackStyle.copyWith(fontSize: 14)),
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
