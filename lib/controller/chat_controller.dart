import 'package:buah_tangan_co/model/chat_message.dart';
import 'package:buah_tangan_co/themes/font_style.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  List<ChatMessage> chatting = [
    ChatMessage(
        order: Wrap(
          children: [
            Image.asset(
              'assets/images/nasi_krawu.png',
              height: 53,
            ),
            const SizedBox(
              width: 20,
            ),
            Wrap(
              direction: Axis.vertical,
              children: [
                Text(
                  'No. Pesanan : 211109JUGHI',
                  style: mediumLoraBlackStyle.copyWith(fontSize: 12),
                ),
                Text(
                  'Total : Rp. 20.000',
                  style: mediumLoraBlackStyle.copyWith(fontSize: 12),
                ),
                Text(
                  'Selesai',
                  style: mediumLoraBlackStyle.copyWith(
                    fontSize: 12,
                    color: const Color(0xff00BF08),
                  ),
                ),
              ],
            )
          ],
        ),
        isReciever: false),
    ChatMessage(messageContent: 'Ditunggu Ya', isReciever: true),
  ].obs;

  void addToChatting(ChatMessage value) {
    chatting.add(value);
  }

  List<Message> listChat = [
    Message(
      message: 'Hi Terimakasih telah mengunjungi toko kami,'
          'pesan kamu akan di balas sebentar lagi',
      sender: 'OlehOlehOfficial',
      urlPhoto: 'http://placeimg.com/640/480/business',
      totMessage: 10,
    ),
    Message(
      message: 'Barang ready kak, silahkan memesan',
      sender: 'TokoOlehOleh',
      urlPhoto: "http://placeimg.com/640/480/technics",
      totMessage: 5,
    ),
    Message(
      message: 'Hi Terimakasih telah mengunjungi toko kami,'
          'pesan kamu akan di balas sebentar lagi',
      sender: 'OfficialStore',
      urlPhoto: "http://placeimg.com/640/480/nature",
    ),
    Message(
      message: 'Barang ready kak, silahkan memesan',
      sender: 'PTOlehOleh',
      urlPhoto: "http://placeimg.com/640/480/animals",
      totMessage: 1,
    ),
  ].obs;

  void updateMessage(Message value) {
    int index = listChat.indexWhere((message) => message == value);
    listChat[index].totMessage = 0;
  }
}
