import 'package:buah_tangan_co/common/routes.dart';
import 'package:buah_tangan_co/controller/chat_controller.dart';
import 'package:buah_tangan_co/controller/detail_item_controller.dart';
import 'package:buah_tangan_co/views/chat/chat_page.dart';
import 'package:buah_tangan_co/views/chat/detail_chat_page.dart';
import 'package:buah_tangan_co/views/detail_item/detail_item_page.dart';
import 'package:buah_tangan_co/views/detail_toko/detail_toko_page.dart';
import 'package:buah_tangan_co/views/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ChatController(), tag: 'message', fenix: true);
    Get.put(DetItemController(), tag: 'permanent');
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme:
            const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.dark)
                .copyWith(color: Colors.white),
        scaffoldBackgroundColor: Colors.white,
      ),
      getPages: AppRoute.route,
      initialRoute: AppRoute.splashRoute,
    );
  }
}
