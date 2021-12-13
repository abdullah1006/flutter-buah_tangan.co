import 'package:buah_tangan_co/common/routes.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  void toHome() => Get.offAllNamed(AppRoute.homeRoute);
  void toChat() => Get.toNamed(AppRoute.chatRoute);
  void toShoppingBag() => Get.toNamed(AppRoute.shoppingBagRoute);
  void toWishlist() => Get.toNamed(AppRoute.wishlistRoute);
}
