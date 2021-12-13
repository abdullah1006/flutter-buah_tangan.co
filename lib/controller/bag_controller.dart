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
}
