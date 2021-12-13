import 'package:buah_tangan_co/model/item_model.dart';
import 'package:buah_tangan_co/themes/font_style.dart';
import 'package:buah_tangan_co/util/convert_currency.dart';
import 'package:buah_tangan_co/widget/rating_item.dart';
import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final ItemModel itemModel;
  const CardItem({
    required this.itemModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              'assets/images/${itemModel.src}',
              height: 100,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            itemModel.title,
            style: boldLoraBlackStyle,
          ),
          const SizedBox(
            height: 3,
          ),
          RatingItem(
            rating: itemModel.rating,
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            ConvertCurrency.rpFormating(itemModel.price),
            style: boldLoraBlackStyle,
          ),
        ],
      ),
    );
  }
}
