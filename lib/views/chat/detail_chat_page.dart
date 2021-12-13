import 'dart:async';

import 'package:buah_tangan_co/controller/chat_controller.dart';
import 'package:buah_tangan_co/model/chat_message.dart';
import 'package:buah_tangan_co/themes/font_style.dart';
import 'package:buah_tangan_co/views/chat/component/card_quick_message.dart';
import 'package:buah_tangan_co/views/chat/component/chat_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DetailChatPage extends StatefulWidget {
  const DetailChatPage({Key? key}) : super(key: key);

  @override
  State<DetailChatPage> createState() => _DetailChatPageState();
}

class _DetailChatPageState extends State<DetailChatPage> {
  final _chatController = Get.find<ChatController>(tag: 'message');
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
    super.initState();
  }

  List<String> quickMessaage = [
    'Hai!, Apakah produk masih ada ?',
    'Terimakasih',
    'Ditunggu Ya',
    'Hai!, Bisa dikirim hari ini ?',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffB9C8CB),
        appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          title: ListTile(
            leading: const CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/images/profile_toko.png'),
              backgroundColor: Colors.transparent,
            ),
            title: Text(
              'OlehOlehOfficial',
              style: boldLoraBlackStyle.copyWith(fontSize: 12),
            ),
            subtitle: Row(
              children: [
                SvgPicture.asset('assets/icons/circle.svg'),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'Sedang Aktif',
                  style: regLoraStyle.copyWith(fontSize: 11),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.call),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Obx(
                () => ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  itemCount: _chatController.chatting.length,
                  itemBuilder: (context, index) => Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: ChatDialog(
                      chatMessage: _chatController.chatting[index],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              color: const Color(0xffB9C8CB),
              height: 40,
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                shrinkWrap: true,
                primary: false,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      _chatController.addToChatting(
                        ChatMessage(
                            isReciever: true,
                            messageContent: quickMessaage[index]),
                      );
                      Timer(
                          const Duration(milliseconds: 200),
                          () => _scrollController.jumpTo(
                              _scrollController.position.maxScrollExtent));
                    },
                    child: CardQuickMessage(
                      message: quickMessaage[index],
                    ),
                  );
                },
                itemCount: quickMessaage.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 39,
                      width: 39,
                      child: const Icon(Icons.camera_alt),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      constraints:
                          const BoxConstraints(minHeight: 39, maxHeight: 150),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      padding: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: SingleChildScrollView(
                        child: TextField(
                          textAlign: TextAlign.left,
                          style: regLoraBlackStyle.copyWith(fontSize: 14),
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          controller: _messageController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.only(
                              left: 6,
                              bottom: 6,
                            ),
                            border: InputBorder.none,
                            hintText: 'Ketik Disini...',
                            hintStyle: regLoraStyle.copyWith(fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (_messageController.text.isNotEmpty) {
                        _chatController.addToChatting(
                          ChatMessage(
                              isReciever: true,
                              messageContent: _messageController.text),
                        );
                        _messageController.text = '';
                        Timer(
                            const Duration(milliseconds: 200),
                            () => _scrollController.jumpTo(
                                _scrollController.position.maxScrollExtent));
                      }
                    },
                    child: Container(
                      height: 39,
                      width: 39,
                      child: const Icon(Icons.send, color: Colors.white),
                      decoration: BoxDecoration(
                          color: const Color(0xffFFA600),
                          borderRadius: BorderRadius.circular(100)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
