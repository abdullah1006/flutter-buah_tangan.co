import 'package:buah_tangan_co/common/routes.dart';
import 'package:buah_tangan_co/controller/bag_controller.dart';
import 'package:buah_tangan_co/themes/font_style.dart';
import 'package:buah_tangan_co/views/shopping_bag/component/card_bag_item.dart';
import 'package:buah_tangan_co/views/shopping_bag/component/card_bag_shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ShoppingBagPage extends StatelessWidget {
  const ShoppingBagPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bagC = Get.put(BagController());
    int length = 2;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          title: Text(
            'Keranjang',
            style: boldLoraBlackStyle.copyWith(fontSize: 18),
          ),
          actions: [
            IconButton(
              onPressed: () => Get.toNamed(AppRoute.wishlistRoute),
              icon: SvgPicture.asset(
                'assets/icons/heart.svg',
                color: Colors.black,
                height: 18,
                width: 18,
              ),
            ),
            IconButton(
              onPressed: () => Get.toNamed(AppRoute.profileRoute),
              icon: SvgPicture.asset('assets/icons/profile.svg'),
            )
          ],
        ),
        body: Column(
          children: [
            Row(
              children: [
                Obx(() => Checkbox(
                      value: bagC.checkAll.value,
                      onChanged: (value) => bagC.setCheckAll(),
                    )),
                Text(
                  'Pilih Semua',
                  style: regLoraBlackStyle.copyWith(fontSize: 14),
                ),
              ],
            ),
            Container(
              height: 5,
              width: double.infinity,
              color: const Color(0xffF0F0F0),
            ),
            Expanded(
              child: ListView.separated(
                  padding: const EdgeInsets.only(bottom: 60),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => CardBagShop(),
                  separatorBuilder: (context, index) => Container(
                        height: 5,
                        width: double.infinity,
                        color: const Color(0xffF0F0F0),
                      ),
                  itemCount: 1),
            ),
          ],
        ),
        floatingActionButton: Row(
          children: [
            const Spacer(),
            SizedBox(
              width: 150,
              height: 40,
              child: ElevatedButton(
                onPressed: () => bagC.openJastip(),
                child: Text(
                  'BUKA JASTIP',
                  style: regRobotoWhiteStyle.copyWith(fontSize: 14),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xffE09201),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 150,
              height: 40,
              child: ElevatedButton(
                onPressed: () => bagC.toOrderingPage(),
                child: Text(
                  'BAYAR',
                  style: regRobotoWhiteStyle.copyWith(fontSize: 14),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
