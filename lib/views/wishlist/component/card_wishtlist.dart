import 'package:buah_tangan_co/themes/font_style.dart';
import 'package:buah_tangan_co/util/convert_currency.dart';
import 'package:buah_tangan_co/widget/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardWishlist extends StatelessWidget {
  const CardWishlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: 84,
            child: Row(
              children: [
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
                      ConvertCurrency.rpFormating(10000),
                      style: boldLoraBlackStyle,
                    ),
                    RatingItem(
                      rating: 5,
                    ),
                    Text(
                      'Kota Gresik',
                      style: regLoraBlackStyle.copyWith(fontSize: 12),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                height: 28,
                width: 38,
                child: ElevatedButton(
                  onPressed: () {},
                  child: SvgPicture.asset(
                    'assets/icons/trash.svg',
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: const BorderSide(
                        width: 2,
                        color: Color(0xff727272),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: SizedBox(
                  height: 28,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Tambah Ke Keranjang',
                      style: mediumLoraWhiteStyle.copyWith(fontSize: 12),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      primary: const Color(0xff507957),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: const BorderSide(
                          width: 2,
                          color: Color(0xff727272),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
