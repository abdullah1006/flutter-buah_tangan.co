import 'package:buah_tangan_co/common/routes.dart';
import 'package:buah_tangan_co/themes/font_style.dart';
import 'package:buah_tangan_co/views/shopping_bag/component/dialog_jastip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BagController extends GetxController {
  TextEditingController jastipC = TextEditingController();
  RxBool checkAll = false.obs;

  void setCheckAll() {
    checkAll.value = !checkAll.value;
    item.forEach((element) {
      element.onCheck = checkAll.value;
    });
    item.refresh();
  }

  void toOrderingPage() {
    Get.toNamed(AppRoute.orderingRoute);
  }

  void openJastip() {
    Get.dialog(const DialogJastip());
  }

  void copyText() {
    ClipboardData(text: jastipC.text);
    Get.snackbar(
      'Berhasil',
      'Anda Berhasil Mengcopy link',
      colorText: Colors.white,
      backgroundColor: Colors.black,
      duration: const Duration(seconds: 1, milliseconds: 800),
    );
  }

  @override
  void onInit() {
    jastipC.text = 'http://buahtangan.co/hZasJkLLOp';
    update();
    super.onInit();
  }

  var item = <ItemBagModel>[
    ItemBagModel(
        id: 0,
        nama: 'Nasi Krawu',
        harga: 12000,
        srcGambar: 'assets/images/nasi_krawu.png'),
    ItemBagModel(
        id: 1,
        nama: 'Kue Pudak',
        harga: 6000,
        srcGambar: 'assets/images/kue_pudak.png')
  ].obs;

  void increment(ItemBagModel value) {
    item.singleWhere((element) => element == value).jumlah++;
    item.refresh();
  }

  void decrement(ItemBagModel value) {
    if (item.singleWhere((element) => element == value).jumlah > 1) {
      item.singleWhere((element) => element == value).jumlah--;
    }
    item.refresh();
  }

  void delete(ItemBagModel value) {
    item.removeWhere((element) => element.id == value.id);

    item.refresh();
  }

  void checkItem(ItemBagModel value) {
    item.singleWhere((element) => element == value).onCheck =
        !item.singleWhere((element) => element == value).onCheck;
    item.refresh();
  }
}

class ItemBagModel {
  String nama;
  int id;
  int harga;
  String srcGambar;
  int jumlah;
  bool onCheck;

  ItemBagModel({
    required this.id,
    required this.nama,
    required this.harga,
    required this.srcGambar,
    this.jumlah = 1,
    this.onCheck = false,
  });
}
