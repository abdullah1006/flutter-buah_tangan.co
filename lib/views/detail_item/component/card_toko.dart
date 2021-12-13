import 'package:buah_tangan_co/common/routes.dart';
import 'package:buah_tangan_co/themes/font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CardToko extends StatelessWidget {
  const CardToko({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      height: 80,
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.5),
          blurRadius: 2,
        ),
      ], color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/profile_toko.png'),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'OlehOlehOfficial',
                  style: boldLoraBlackStyle.copyWith(fontSize: 12),
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/circle.svg'),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Sedang Aktif',
                      style: regLoraStyle.copyWith(
                          fontSize: 12, color: const Color(0xff666666)),
                    ),
                  ],
                ),
                Text(
                  'Kota Gresik',
                  style: regLoraStyle.copyWith(
                      fontSize: 12, color: const Color(0xff666666)),
                ),
              ],
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              Get.toNamed(AppRoute.detailTokoRoute);
            },
            child: Text(
              'Kunjungi Toko',
              style: boldLoraBlackStyle.copyWith(fontSize: 11),
            ),
            style: TextButton.styleFrom(
              side: const BorderSide(
                width: 2,
                color: Color(0xffFFA600),
              ),
            ),
          )
        ],
      ),
    );
  }
}
