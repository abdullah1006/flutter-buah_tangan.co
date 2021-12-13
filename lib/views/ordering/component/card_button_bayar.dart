import 'package:buah_tangan_co/common/pay_type.dart';
import 'package:buah_tangan_co/controller/ordering_controller.dart';
import 'package:buah_tangan_co/themes/font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CardButtonBayar extends StatelessWidget {
  final List<PayType> payType;
  const CardButtonBayar({required this.payType, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderC = Get.find<OrderingController>();
    return SizedBox(
      height: 300,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index1) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    payType[index1].method,
                    style: boldLoraBlackStyle.copyWith(fontSize: 14),
                  ),
                ),
                ListView.builder(
                  padding: const EdgeInsets.only(left: 10),
                  itemExtent: 30,
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, index2) => ListTile(
                    onTap: () {
                      Get.back();
                      orderC.pembayaran.value =
                          payType[index1].childMethod[index2];
                    },
                    dense: true,
                    leading: SvgPicture.asset(
                      'assets/icons/credit.svg',
                      height: 20,
                    ),
                    horizontalTitleGap: 0,
                    title: Text(
                      payType[index1].childMethod[index2],
                      style: regLoraBlackStyle.copyWith(fontSize: 14),
                    ),
                  ),
                  itemCount: payType[index1].childMethod.length,
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 5,
                color: const Color(0xffF0F0F0),
              ),
          itemCount: payType.length),
    );
  }
}
