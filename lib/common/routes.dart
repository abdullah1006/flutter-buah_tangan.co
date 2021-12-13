import 'package:buah_tangan_co/views/chat/chat_page.dart';
import 'package:buah_tangan_co/views/chat/detail_chat_page.dart';
import 'package:buah_tangan_co/views/detail_item/detail_item_page.dart';
import 'package:buah_tangan_co/views/detail_toko/detail_toko_page.dart';
import 'package:buah_tangan_co/views/home/home_page.dart';
import 'package:buah_tangan_co/views/ordering/ordering_page.dart';
import 'package:buah_tangan_co/views/settings/settings_page.dart';
import 'package:buah_tangan_co/views/shopping_bag/bag_page.dart';
import 'package:buah_tangan_co/views/wishlist/wishlist_page.dart';
import 'package:get/get.dart';

class AppRoute {
  static const String homeRoute = '/home';
  static const String detailItemRoute = '/detailItemPage';
  static const String detailTokoRoute = '/detailTokoPage';
  static const String detailChatRoute = '/detailChatPage';
  static const String chatRoute = '/chatPage';
  static const String shoppingBagRoute = '/shoppingBagPage';
  static const String settingsRoute = '/settingsPage';
  static const String wishlistRoute = '/wishlistPage';
  static const String orderingRoute = '/orderingRoute';

  static List<GetPage<dynamic>> route = [
    GetPage(name: homeRoute, page: () => const HomePage()),
    GetPage(
        name: detailItemRoute,
        page: () => const DetailItemPage(),
        transition: Transition.cupertino),
    GetPage(
        name: detailTokoRoute,
        page: () => const DetailTokoPage(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: chatRoute,
        page: () => const ChatPage(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: detailChatRoute,
        page: () => const DetailChatPage(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: shoppingBagRoute,
        page: () => const ShoppingBagPage(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: wishlistRoute,
        page: () => const WishlistPage(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: settingsRoute,
        page: () => const SettingsPage(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: orderingRoute,
        page: () => const OrderingPage(),
        transition: Transition.rightToLeftWithFade),
  ];
}
