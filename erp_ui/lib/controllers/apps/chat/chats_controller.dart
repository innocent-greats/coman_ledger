import 'package:flatten/controllers/my_controller.dart';
import 'package:flatten/models/chat.dart';
import 'package:flutter/material.dart';

class ChatsController extends MyController {
  List<Chat> chats = [];

  ChatsController();

  TextEditingController message = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    Chat.dummyList.then((value) {
      chats = value.sublist(0, 10);
      update();
    });
  }

  @override
  String getTag() {
    return "chats_controller";
  }
}
