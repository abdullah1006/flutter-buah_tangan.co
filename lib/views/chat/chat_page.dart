import 'package:buah_tangan_co/common/routes.dart';
import 'package:buah_tangan_co/controller/chat_controller.dart';
import 'package:buah_tangan_co/model/chat_message.dart';
import 'package:buah_tangan_co/themes/font_style.dart';
import 'package:buah_tangan_co/views/chat/component/card_chat.dart';
import 'package:buah_tangan_co/widget/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>
    with SingleTickerProviderStateMixin {
  //Note : Ketika user menyampai di page ini, dan permanent true, nanti controller akan disimpan di memory, dan nggk akan kehapus
  //Note : Kalau permanent false, maka kalau pindah page di tree atasnya, controller akan dihapus, dan ke reset ketika user ke page ini
  final _chatController = Get.put(ChatController(), permanent: true);
  TabController? _controller;

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();
    List<Message> allChat = _chatController.listChat;
    List<Message> unreadChat =
        _chatController.listChat.where((item) => item.totMessage != 0).toList();
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'Chat',
          style: boldLoraBlackStyle.copyWith(fontSize: 18),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(AppRoute.profileRoute),
            icon: SvgPicture.asset('assets/icons/profile.svg'),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SearchWidget(
              controller: _searchController,
              onPressed: () {},
              hintText: 'Cari Kontak, Penjual & Pesan',
            ),
            SizedBox(
              height: 35,
              child: TabBar(
                padding: const EdgeInsets.only(top: 10),
                labelColor: const Color(0xffE09201),
                labelStyle: GoogleFonts.roboto(fontSize: 12),
                unselectedLabelColor: Colors.black,
                indicatorColor: const Color(0xffE09201),
                controller: _controller,
                tabs: const [
                  Tab(text: 'Semua'),
                  Tab(text: 'Belum Dibaca'),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Obx(
                () => TabBarView(
                  controller: _controller,
                  children: [
                    ListView.separated(
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              _chatController.updateMessage(allChat[index]);
                              Get.toNamed(AppRoute.detailChatRoute);
                            },
                            child: CardChat(
                              message: allChat[index],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const Divider(
                              color: Color(0xffC4C4C4),
                            ),
                        itemCount: allChat.length),
                    ListView.separated(
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                _chatController
                                    .updateMessage(unreadChat[index]);
                                Get.toNamed(AppRoute.detailChatRoute);
                              },
                              child: CardChat(
                                message: unreadChat[index],
                              ),
                            ),
                        separatorBuilder: (context, index) => const Divider(
                              color: Color(0xffC4C4C4),
                            ),
                        itemCount: unreadChat.length),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
