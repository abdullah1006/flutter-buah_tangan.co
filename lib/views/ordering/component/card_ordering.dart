import 'package:buah_tangan_co/themes/font_style.dart';
import 'package:buah_tangan_co/util/convert_currency.dart';
import 'package:buah_tangan_co/widget/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardOrdering extends StatelessWidget {
  const CardOrdering({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'OlehOlehOfficial',
          style: boldLoraBlackStyle.copyWith(fontSize: 14),
        ),
        Text(
          'Kota Gresik',
          style: regLoraBlackStyle.copyWith(fontSize: 12),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 84,
          child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  'assets/images/nasi_krawu.png',
                  height: 84,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nasi Krawu',
                    style: regLoraBlackStyle.copyWith(fontSize: 16),
                  ),
                  Text(
                    '1 Barang',
                    style: regLoraBlackStyle.copyWith(fontSize: 12),
                  ),
                  Text(
                    ConvertCurrency.rpFormating(10000),
                    style: boldLoraBlackStyle,
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
