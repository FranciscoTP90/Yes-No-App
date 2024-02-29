import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helper/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();
  List<Message> messages = [
    Message(text: 'Hola', fromWho: FromWho.me),
    Message(text: 'Ya regresaste?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    // siempre from me porque yo lo escribo-envio
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messages.add(newMessage);
    if (text.endsWith("?")) {
      herReply();
    }
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messages.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  void moveScrollToBottom() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
