import 'package:buah_tangan_co/common/routes.dart';
import 'package:buah_tangan_co/controller/custom_drawer_controller.dart';
import 'package:buah_tangan_co/themes/font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final drawC = Get.put(CustomDrawerController());
    return SafeArea(
      child: Drawer(
        backgroundColor: const Color(0xff151515),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.only(top: 30),
          children: [
            ListTile(
              leading: Image.asset(
                'assets/images/profile_user.png',
              ),
              title: Text(
                'Customer 1',
                style: mediumRobotoWhiteStyle.copyWith(fontSize: 18),
              ),
              subtitle: Text(
                'customer1@gmail.com',
                style: regRobotoWhiteStyle.copyWith(fontSize: 12),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ButtonDrawer(
                label: 'Menu Utama',
                onTap: () => drawC.goToHome(),
                srcImage: 'assets/icons/home.svg'),
            ButtonDrawer(
                label: 'Chat',
                onTap: () => drawC.goToChat(),
                srcImage: 'assets/icons/chat1.svg'),
            ButtonDrawer(
                label: 'Keranjang',
                onTap: () => drawC.goToBag(),
                srcImage: 'assets/icons/bag.svg'),
            ButtonDrawer(
                label: 'Kesukaan',
                onTap: () => drawC.goToWhislist(),
                srcImage: 'assets/icons/heart.svg'),
            ButtonDrawer(
                label: 'Pengaturan',
                onTap: () => drawC.goToSettings(),
                srcImage: 'assets/icons/setting.svg'),
          ],
        ),
      ),
    );
  }
}

class ButtonDrawer extends StatelessWidget {
  String label;
  VoidCallback onTap;
  String srcImage;
  ButtonDrawer({
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
          leading: SvgPicture.asset(
            srcImage,
            width: 24,
            height: 24,
          ),
          title: Text(
            label,
            style: boldRobotoWhiteStyle.copyWith(fontSize: 16),
          ),
          onTap: onTap,
          trailing: SvgPicture.asset(
            'assets/icons/arrow.svg',
            width: 20,
            height: 20,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20),
          height: 1,
          color: const Color(0xff727272),
        ),
      ],
    );
  }
}
