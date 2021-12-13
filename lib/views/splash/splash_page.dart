import 'package:buah_tangan_co/common/routes.dart';
import 'package:buah_tangan_co/themes/font_style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool loading = false;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 100)).then((value) {
      setState(() {
        loading = true;
      });
      Future.delayed(const Duration(seconds: 3, milliseconds: 50))
          .then((value) => Get.offNamed(AppRoute.homeRoute));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 250,
            ),
            const SizedBox(
              height: 50,
            ),
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 100,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffE5E5E5),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(seconds: 3),
                  width:
                      (loading) ? MediaQuery.of(context).size.width - 100 : 0,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffFFA600),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
