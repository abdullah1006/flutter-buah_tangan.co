import 'package:buah_tangan_co/common/routes.dart';
import 'package:buah_tangan_co/controller/detail_item_controller.dart';
import 'package:buah_tangan_co/model/item_model.dart';
import 'package:buah_tangan_co/themes/font_style.dart';
import 'package:buah_tangan_co/widget/card_item.dart';
import 'package:buah_tangan_co/widget/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';

class DetailTokoPage extends StatelessWidget {
  const DetailTokoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemController = Get.find<DetItemController>(tag: 'permanent');
    TextEditingController searchController = TextEditingController();
    final childrenItem = <ItemModel>[];
    for (var i = 0; i < 4; i++) {
      childrenItem.addAll(itemController.listItem);
    }
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark
            .copyWith(statusBarColor: const Color(0xffFFA600)),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0xffFFA600),
        centerTitle: true,
        title: SearchWidget(
          controller: searchController,
          onPressed: () {},
          color: const Color(0xffE09201),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          )
        ],
        elevation: 0,
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(color: Color(0xffFFA600)),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/profile_toko.png',
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'OlehOlehOfficial',
                            style: boldLoraBlackStyle.copyWith(fontSize: 16),
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
                                    fontSize: 12,
                                    color: const Color(0xff666666)),
                              ),
                            ],
                          ),
                          Text(
                            'Kota Gresik',
                            style: mediumLoraBlackStyle.copyWith(
                                fontSize: 16, color: const Color(0xff323232)),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    //NOTE : BUTTON LOKASI DAN CHAT
                    Column(
                      children: [
                        SizedBox(
                          width: 90,
                          height: 30,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  size: 13,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  'Lokasi',
                                  style:
                                      boldLoraWhiteStyle.copyWith(fontSize: 13),
                                ),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 15),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 30,
                          width: 90,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.message,
                                  size: 13,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  'Chat',
                                  style:
                                      boldLoraWhiteStyle.copyWith(fontSize: 13),
                                ),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 15),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 23,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '4.5/5.0\nDari Pembeli',
                      textAlign: TextAlign.center,
                      style: mediumLoraBlackStyle,
                    ),
                    Text(
                      '99%\nPerforma Chat',
                      textAlign: TextAlign.center,
                      style: mediumLoraBlackStyle,
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            width: 100,
            padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
            child: Row(
              children: [
                Text(
                  'Makanan',
                  style: mediumLoraBlackStyle,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  'Minuman',
                  style: mediumLoraBlackStyle.copyWith(
                    color: const Color(0xff808080),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text('Souvenir',
                    style: mediumLoraBlackStyle.copyWith(
                        color: const Color(0xff808080)))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Wrap(
              spacing: 10,
              runSpacing: 20,
              alignment: WrapAlignment.spaceBetween,
              children: childrenItem
                  .map(
                    (item) => InkWell(
                        onTap: () {
                          Get.toNamed(
                            AppRoute.detailItemRoute,
                            arguments: item.index,
                          );
                        },
                        child: CardItem(itemModel: item)),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
