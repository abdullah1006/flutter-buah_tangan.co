import 'package:buah_tangan_co/common/routes.dart';
import 'package:get/get.dart';

class CustomDrawerController extends GetxController {
  void goToChat() {
    Get.back(closeOverlays: true);
    if (Get.currentRoute != AppRoute.chatRoute) {
      Get.toNamed(AppRoute.chatRoute);
    }
  }

  void goToHome() {
    Get.back(closeOverlays: true);
    if (Get.currentRoute != AppRoute.homeRoute) {
      Get.offNamed(AppRoute.homeRoute);
    }
  }

  void goToBag() {
    Get.back(closeOverlays: true);
    if (Get.currentRoute != AppRoute.shoppingBagRoute) {
      Get.toNamed(AppRoute.shoppingBagRoute);
    }
  }

  void goToWhislist() {
    Get.back(closeOverlays: true);
    if (Get.currentRoute != AppRoute.wishlistRoute) {
      Get.toNamed(AppRoute.wishlistRoute);
    }
  }

  void goToSettings() {
    Get.back(closeOverlays: true);
    if (Get.currentRoute != AppRoute.settingsRoute) {
      Get.toNamed(AppRoute.settingsRoute);
    }
  }
}
