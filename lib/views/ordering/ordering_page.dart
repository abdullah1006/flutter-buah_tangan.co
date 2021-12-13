import 'package:buah_tangan_co/controller/ordering_controller.dart';
import 'package:buah_tangan_co/themes/font_style.dart';
import 'package:buah_tangan_co/util/convert_currency.dart';
import 'package:buah_tangan_co/views/ordering/component/card_ordering.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class OrderingPage extends StatelessWidget {
  const OrderingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderingC = Get.put(OrderingController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'Pengiriman',
          style: boldLoraBlackStyle.copyWith(fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Alamat Pengiriman',
                    style: boldLoraBlackStyle.copyWith(fontSize: 14),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Pilih Alamat',
                      style: boldLoraWhiteStyle.copyWith(
                        color: const Color(0xff018306),
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                'Mohamad Romli (081155234677)\n'
                'Jl. Raya Ahmad Yani No. 23, Surabaya',
                style: regLoraBlackStyle.copyWith(fontSize: 12),
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, index) => const CardOrdering(),
                  separatorBuilder: (context, index) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        height: 1,
                        width: double.infinity,
                        color: const Color(0xffF0F0F0),
                      ),
                  itemCount: 2),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 43,
                child: Obx(() => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary:
                            (orderingC.pengiriman.value == 'Pilih Pengiriman')
                                ? const Color(0xffC4C4C4)
                                : const Color(0xffE09201),
                      ),
                      onPressed: () => orderingC.pilihPengiriman(),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icons/in_transit.png',
                            color: (orderingC.pengiriman.value ==
                                    'Pilih Pengiriman')
                                ? Colors.black
                                : Colors.white,
                          ),
                          const SizedBox(
                            width: 13,
                          ),
                          Text(
                            orderingC.pengiriman.value,
                            style: boldLoraBlackStyle.copyWith(
                              fontSize: 14,
                              color: (orderingC.pengiriman.value ==
                                      'Pilih Pengiriman')
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                          const Spacer(),
                          SvgPicture.asset(
                            'assets/icons/arrow.svg',
                            color: (orderingC.pengiriman.value ==
                                    'Pilih Pengiriman')
                                ? Colors.black
                                : Colors.white,
                          )
                        ],
                      ),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Subtotal',
                    style: mediumLoraBlackStyle.copyWith(fontSize: 14),
                  ),
                  const Spacer(),
                  Text(
                    ConvertCurrency.rpFormating(15000),
                    style: boldLoraBlackStyle,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 43,
                child: Obx(() => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary:
                            (orderingC.pembayaran.value == 'Pilih Pembayaran')
                                ? const Color(0xffC4C4C4)
                                : const Color(0xffE09201),
                      ),
                      onPressed: () => orderingC.pilihPembayaran(),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icons/money_bag.png',
                            color: (orderingC.pembayaran.value ==
                                    'Pilih Pembayaran')
                                ? Colors.black
                                : Colors.white,
                          ),
                          const SizedBox(
                            width: 13,
                          ),
                          Text(
                            orderingC.pembayaran.value,
                            style: boldLoraBlackStyle.copyWith(
                              fontSize: 14,
                              color: (orderingC.pembayaran.value ==
                                      'Pilih Pembayaran')
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                          const Spacer(),
                          SvgPicture.asset(
                            'assets/icons/arrow.svg',
                            color: (orderingC.pembayaran.value ==
                                    'Pilih Pembayaran')
                                ? Colors.black
                                : Colors.white,
                          )
                        ],
                      ),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Rincian',
                style: boldLoraBlackStyle.copyWith(fontSize: 14),
              ),
              Row(
                children: [
                  Text(
                    'Nasi Krawu (1 Barang)',
                    style: mediumLoraBlackStyle.copyWith(fontSize: 12),
                  ),
                  const Spacer(),
                  Text(
                    ConvertCurrency.rpFormating(15000),
                    style: mediumLoraBlackStyle,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Biaya Pengiriman',
                    style: mediumLoraBlackStyle.copyWith(fontSize: 12),
                  ),
                  const Spacer(),
                  Text(
                    ConvertCurrency.rpFormating(9000),
                    style: mediumLoraBlackStyle,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Biaya Admin',
                    style: mediumLoraBlackStyle.copyWith(fontSize: 12),
                  ),
                  const Spacer(),
                  Text(
                    ConvertCurrency.rpFormating(2000),
                    style: mediumLoraBlackStyle,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Total',
                    style: mediumLoraBlackStyle.copyWith(fontSize: 16),
                  ),
                  const Spacer(),
                  Text(
                    ConvertCurrency.rpFormating(26000),
                    style: boldLoraBlackStyle.copyWith(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 43,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff507957),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Bayar',
                    style: boldLoraWhiteStyle.copyWith(fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
