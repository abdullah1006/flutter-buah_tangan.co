import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RatingItem extends StatelessWidget {
  int? rating;
  double sizeIcon;
  RatingItem({
    this.sizeIcon = 10,
    Key? key,
    this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> ratingItems = [];
    for (var i = 0; i < 5; i++) {
      ratingItems.add(
        SvgPicture.asset(
          'assets/icons/star.svg',
          width: sizeIcon,
          color: i < rating! ? const Color(0xffFFA600) : null,
        ),
      );
    }
    return Row(
      children: ratingItems,
    );
  }
}
