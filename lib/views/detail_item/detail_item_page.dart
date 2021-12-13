import 'package:buah_tangan_co/common/routes.dart';
import 'package:buah_tangan_co/controller/detail_item_controller.dart';
import 'package:buah_tangan_co/model/item_model.dart';
import 'package:buah_tangan_co/themes/font_style.dart';
import 'package:buah_tangan_co/util/convert_currency.dart';
import 'package:buah_tangan_co/views/detail_item/component/card_toko.dart';
import 'package:buah_tangan_co/widget/card_item.dart';
import 'package:buah_tangan_co/widget/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';

class DetailItemPage extends StatefulWidget {
  const DetailItemPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailItemPage> createState() => _DetailItemPageState();
}

class _DetailItemPageState extends State<DetailItemPage> {
  final itemController = Get.find<DetItemController>(tag: 'permanent');
  final counterController = Get.put(DetItemController());

  @override
  Widget build(BuildContext context) {
    final index = Get.arguments as int;
    final item = itemController.listItem[index];

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark
          .copyWith(statusBarColor: Colors.transparent),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      'assets/images/${item.src}',
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 20, left: 20),
                            width: 35,
                            height: 35,
                            child: const Icon(Icons.arrow_back),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 255, 255, 0.6),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            itemController.setFavorite(index);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 20, right: 20),
                            width: 35,
                            height: 35,
                            child: Obx(
                              () => (itemController
                                      .listItem.value[index].favorite)
                                  ? const Icon(Icons.favorite,
                                      color: Color(0xffE09201))
                                  : const Icon(Icons.favorite_outline,
                                      color: Color(0xffE09201)),
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 255, 255, 0.6),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: boldLoraBlackStyle.copyWith(fontSize: 28),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ConvertCurrency.rpFormating(item.price),
                            style: boldLoraBlackStyle.copyWith(fontSize: 18),
                          ),
                          RatingItem(
                            rating: item.rating,
                            sizeIcon: 17,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          //NOTE : Button -
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.5),
                                    blurRadius: 2,
                                  )
                                ]),
                            child: TextButton(
                                onPressed: () {
                                  (counterController.counter.value > 0)
                                      ? counterController.decrement()
                                      : null;
                                },
                                child:
                                    SvgPicture.asset('assets/icons/minus.svg')),
                          ),
                          const SizedBox(
                            width: 14,
                          ),
                          Obx(
                            () => Text(
                              '${counterController.counter}',
                              style: regLoraBlackStyle.copyWith(fontSize: 24),
                            ),
                          ),
                          const SizedBox(
                            width: 14,
                          ),
                          //NOTE : Button +
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.5),
                                    blurRadius: 2,
                                  )
                                ]),
                            child: TextButton(
                                onPressed: () {
                                  counterController.increment();
                                },
                                child:
                                    SvgPicture.asset('assets/icons/plus.svg')),
                          ),
                          const Spacer(),
                          //NOTE: 2 BUTTON Add to Cart dan Buy
                          SizedBox(
                            height: 30,
                            width: 100,
                            child: ElevatedButton(
                              onPressed: () =>
                                  itemController.addToShoppingBag(),
                              child: Text(
                                'Add to Cart',
                                style:
                                    boldLoraWhiteStyle.copyWith(fontSize: 13),
                              ),
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                primary: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                            height: 30,
                            width: 100,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'Buy',
                                style:
                                    boldLoraBlackStyle.copyWith(fontSize: 13),
                              ),
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                primary: const Color(0xffFFA600),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const CardToko(),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Makanan Lain',
                    style: mediumLoraBlackStyle.copyWith(fontSize: 11),
                  ),
                ),
                const SizedBox(
                  height: 8,
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
                                  Get.toNamed(AppRoute.detailItemRoute,
                                      arguments: item.index);
                                },
                                child: CardItem(itemModel: item)),
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.toNamed(AppRoute.chatRoute),
          backgroundColor: const Color(0xffFFA600),
          child: SvgPicture.asset('assets/icons/chat.svg'),
        ),
      ),
    );
  }
}
