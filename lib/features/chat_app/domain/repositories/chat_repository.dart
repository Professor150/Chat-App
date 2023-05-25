import 'package:chat/features/chat_app/presentation/widgets/home_page_widget.dart';
import 'package:flutter/material.dart';

class ChatListRepository extends ChangeNotifier {
  List<Widget> chatList = [
    HomePageChatWidget(name: 'Name', time: '7:45 pm'),
    HomePageChatWidget(name: 'Name', time: '7:45 pm'),
    HomePageChatWidget(name: 'Name', time: '7:45 pm'),
    HomePageChatWidget(name: 'Name', time: '7:45 pm'),
    HomePageChatWidget(name: 'Name', time: '7:45 pm'),
    HomePageChatWidget(name: 'Name', time: '7:45 pm'),
    HomePageChatWidget(name: 'Name', time: '7:45 pm'),
    HomePageChatWidget(name: 'Name', time: '7:45 pm'),
    HomePageChatWidget(name: 'Name', time: '7:45 pm'),
    HomePageChatWidget(name: 'Name', time: '7:45 pm'),
  ];

  void addChatWidget(Widget chatWidget) {
    chatList.add(chatWidget);
    notifyListeners();
  }

  void removeChatWidget(int index) {
    chatList.removeAt(index);
    notifyListeners();
  }
}
