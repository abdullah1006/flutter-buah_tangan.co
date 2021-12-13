import 'package:buah_tangan_co/controller/profile_controller.dart';
import 'package:buah_tangan_co/themes/font_style.dart';
import 'package:buah_tangan_co/util/convert_currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'component/card_stat_profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileC = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'Akun Saya',
          style: boldLoraBlackStyle.copyWith(fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              leading: Image.asset(
                'assets/images/profile_user.png',
              ),
              title: Text(
                'Customer 1',
                style: mediumRobotoWhiteStyle.copyWith(
                    fontSize: 18, color: Colors.black),
              ),
              subtitle: Text(
                'customer1@gmail.com',
                style: regRobotoWhiteStyle.copyWith(
                    fontSize: 12, color: Colors.black),
              ),
            ),
            const CardStatProfile(),
            Container(
              height: 1,
              color: const Color(0xffF0F0F0),
            ),
            ButtonProfile(
                label: 'Menu Utama',
                onTap: () => profileC.toHome(),
                srcImage: 'assets/icons/home.svg'),
            ButtonProfile(
              label: 'Riwayat Transaksi',
              onTap: () {},
              srcImage: 'assets/icons/log_transaction.svg',
              noBlack: true,
            ),
            ButtonProfile(
              label: 'Chat',
              onTap: () => profileC.toChat(),
              srcImage: 'assets/icons/chat1.svg',
              size: 20,
            ),
            ButtonProfile(
                label: 'Keranjang',
                onTap: () => profileC.toShoppingBag(),
                srcImage: 'assets/icons/bag.svg'),
            ButtonProfile(
                label: 'Kesukaan',
                onTap: () => profileC.toWishlist(),
                srcImage: 'assets/icons/heart.svg'),
            // ButtonProfile(
            //     label: 'Pengaturan',
            //     onTap: () {},
            //     srcImage: 'assets/icons/setting.svg'),
          ],
        ),
      ),
    );
  }
}

class ButtonProfile extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final String srcImage;
  final bool noBlack;
  final double? size;
  const ButtonProfile({
    this.size,
    this.noBlack = false,
    required this.label,
    required this.onTap,
    required this.srcImage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          leading: (noBlack)
              ? SvgPicture.asset(
                  srcImage,
                  width: 28,
                  height: 28,
                )
              : SvgPicture.asset(
                  srcImage,
                  width: (size == null) ? 22 : size,
                  height: (size == null) ? 22 : size,
                  color: Colors.black,
                ),
          title: Text(
            label,
            style: boldRobotoWhiteStyle.copyWith(
                fontSize: 16, color: Colors.black),
          ),
          onTap: onTap,
        ),
        Container(
          height: 1,
          color: const Color(0xffF0F0F0),
        ),
      ],
    );
  }
}
