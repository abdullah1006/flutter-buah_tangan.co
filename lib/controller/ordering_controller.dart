import 'package:buah_tangan_co/common/pay_type.dart';
import 'package:buah_tangan_co/common/routes.dart';
import 'package:buah_tangan_co/model/item_model.dart';
import 'package:buah_tangan_co/themes/font_style.dart';
import 'package:buah_tangan_co/views/ordering/component/card_button_bayar.dart';
import 'package:buah_tangan_co/views/ordering/component/card_button_kirim.dart';
import 'package:buah_tangan_co/widget/dialog_notif.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderingController extends GetxController {
  var pembayaran = ''.obs;
  var pengiriman = ''.obs;
  var biayaKirim = 0.obs;
  var biayaAdmin = 0.obs;
  var total = 0.obs;
  var initTotal = 0.obs;

  List<String> pengirimanType = ['Express', 'Reguler', 'Ekonomi'];
  List<int> hargaKirim = [14000, 9000, 6000];

  RxList<ItemModel> listItem = [
    ItemModel(
      index: 3,
      title: 'Nasi Krawu',
      src: 'nasi_krawu.png',
      rating: 5,
      price: 12000,
      favorite: false,
    ),
    ItemModel(
      index: 1,
      title: 'Kue Pudak',
      src: 'kue_pudak.png',
      rating: 4,
      price: 6000,
      favorite: false,
    ),
  ].obs;

  void pilihPengiriman() {
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              horizontalTitleGap: 0,
              leading: GestureDetector(
                onTap: () => Get.back(),
                child: const Icon(
                  Icons.clear,
                  color: Colors.black,
                ),
              ),
              title: Text(
                'Pilih Pengiriman',
                style: boldLoraBlackStyle.copyWith(fontSize: 14),
              ),
            ),
            Container(
              height: 5,
              color: const Color(0xffF0F0F0),
            ),
            const SizedBox(
              height: 10,
            ),
            CardButtonKirim(listHarga: hargaKirim, listType: pengirimanType),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  void pilihPembayaran() {
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              horizontalTitleGap: 0,
              leading: GestureDetector(
                onTap: () => Get.back(),
                child: const Icon(
                  Icons.clear,
                  color: Colors.black,
                ),
              ),
              title: Text(
                'Pilih Pembayaran',
                style: boldLoraBlackStyle.copyWith(fontSize: 14),
              ),
            ),
            Container(
              height: 5,
              color: const Color(0xffF0F0F0),
            ),
            const SizedBox(
              height: 10,
            ),
            CardButtonBayar(payType: payType),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  void bayar() {
    bool status = (pembayaran.value != 'Pilih Pembayaran' &&
        pengiriman.value != 'Pilih Pengiriman');
    if (status) {
      Get.dialog(
        const Center(
          child: CircularProgressIndicator(),
        ),
      );
      Future.delayed(const Duration(seconds: 1)).then((value) => Get.back());
      Get.dialog(const AlertDialogNotif(
          title: 'Berhasil Membayar',
          srcImages: 'assets/images/notif_succes.png'));
      Future.delayed(const Duration(seconds: 1)).then((value) {
        Get.offAllNamed(AppRoute.homeRoute);
      });
    } else {
      Get.dialog(const AlertDialogNotif(
          title: 'Lengkapi Pesanan Anda',
          srcImages: 'assets/images/notif_failed.png'));
      Future.delayed(const Duration(seconds: 1)).then((value) {
        Get.back();
      });
    }
  }

  @override
  void onInit() {
    pembayaran.value = 'Pilih Pembayaran';
    pengiriman.value = 'Pilih Pengiriman';
    for (var element in listItem) {
      total.value = total.value + element.price;
    }
    initTotal.value = total.value;
    super.onInit();
  }
}
