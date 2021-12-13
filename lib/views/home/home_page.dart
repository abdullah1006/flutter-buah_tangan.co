import 'package:buah_tangan_co/common/routes.dart';
import 'package:buah_tangan_co/controller/detail_item_controller.dart';
import 'package:buah_tangan_co/model/item_model.dart';
import 'package:buah_tangan_co/themes/font_style.dart';
import 'package:buah_tangan_co/widget/card_item.dart';
import 'package:buah_tangan_co/widget/custom_drawer.dart';
import 'package:buah_tangan_co/widget/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemController = Get.find<DetItemController>(tag: 'permanent');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle:
            SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.white),
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: SvgPicture.asset('assets/icons/drawer.svg'),
          ),
        ),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/shopping_bag.svg'),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/profile.svg'),
          )
        ],
      ),
      drawer: const CustomDrawer(),
      body: ListView(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/banner_home.png',
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                padding: const EdgeInsets.only(top: 40, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'BuahTangan.co',
                      style: mediumLoraWhiteStyle.copyWith(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Dapatkan Oleh-Oleh\nKesukaanmu Disini',
                      style: boldMontserratWhiteStyle.copyWith(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Pesan Sekarang',
                        style: boldLoraWhiteStyle.copyWith(fontSize: 11),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xffFFA600),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Daftar Populer',
              style: mediumLoraBlackStyle,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 152,
            child: ListView(
              padding: const EdgeInsets.only(left: 20, right: 10),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: itemController.listItem
                  .map(
                    (item) => Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(
                              AppRoute.detailItemRoute + '?asal=HomePage',
                              arguments: item.index);
                        },
                        child: CardItem(itemModel: item),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Daftar Populer',
                  style: mediumLoraBlackStyle,
                ),
                Text(
                  'Show All',
                  style: mediumLoraBlackStyle,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 152,
            child: ListView(
              padding: const EdgeInsets.only(left: 20, right: 10),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: itemController.listItem
                  .map(
                    (item) => Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: CardItem(itemModel: item),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
