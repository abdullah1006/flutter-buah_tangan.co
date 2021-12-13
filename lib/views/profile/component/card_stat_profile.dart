import 'package:buah_tangan_co/themes/font_style.dart';
import 'package:buah_tangan_co/util/convert_currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardStatProfile extends StatelessWidget {
  const CardStatProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 67,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xff474747),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/credit.svg',
                color: const Color(0xffB9C8CB),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Toko Member\n',
                  style: regRobotoWhiteStyle.copyWith(fontSize: 10),
                  children: [
                    TextSpan(
                        text: '3 Toko',
                        style: mediumRobotoWhiteStyle.copyWith(fontSize: 10))
                  ],
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/wallet_fill.svg',
                color: const Color(0xffB9C8CB),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Saldo\n',
                  style: regRobotoWhiteStyle.copyWith(fontSize: 10),
                  children: [
                    TextSpan(
                        text: ConvertCurrency.rpFormating(125000),
                        style: mediumRobotoWhiteStyle.copyWith(fontSize: 10))
                  ],
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/coupon.svg',
                color: const Color(0xffB9C8CB),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Kupon\n',
                  style: regRobotoWhiteStyle.copyWith(fontSize: 10),
                  children: [
                    TextSpan(
                        text: '7 Kupon',
                        style: mediumRobotoWhiteStyle.copyWith(fontSize: 10))
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
