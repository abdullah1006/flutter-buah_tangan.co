import 'package:buah_tangan_co/common/routes.dart';
import 'package:buah_tangan_co/model/item_model.dart';
import 'package:buah_tangan_co/widget/dialog_notif.dart';
import 'package:get/get.dart';

class DetItemController extends GetxController {
  var counter = 0.obs;
  void increment() => counter++;
  void decrement() => counter--;

  void addToShoppingBag() {
    Get.dialog(const AlertDialogNotif(
        title: 'Berhasil Menambahkan Ke Keranjang',
        srcImages: 'assets/images/notif_succes.png'));
    Future.delayed(const Duration(seconds: 1)).then((value) => Get.back());
  }

  RxList<ItemModel> listItem = [
    ItemModel(
      index: 0,
      title: 'Legen',
      src: 'legen.png',
      rating: 4,
      price: 2000,
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
    ItemModel(
      index: 2,
      title: 'Kue Jubung',
      src: 'kue_jubung.png',
      rating: 3,
      price: 5000,
      favorite: false,
    ),
    ItemModel(
      index: 3,
      title: 'Nasi Krawu',
      src: 'nasi_krawu.png',
      rating: 5,
      price: 12000,
      favorite: false,
    ),
  ].obs;

  void setFavorite(int index) {
    var changed = listItem[index];
    changed.favorite = !changed.favorite;
    listItem[index] = changed;
    update(listItem);
  }
}
