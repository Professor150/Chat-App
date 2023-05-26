import 'package:chat/features/chat_app/data/models/logout_model.dart';
import 'package:chat/features/chat_app/domain/repositories/chat_repository.dart';
import 'package:flutter/material.dart';
import 'package:chat/features/chat_app/presentation/widgets/home_page_widget.dart';
import 'package:chat/features/chat_app/presentation/pages/chat_page.dart';
import 'package:provider/provider.dart';

import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final time = DateFormat().locale;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChatListRepository(),
      child: Scaffold(
        floatingActionButton:
            IconButton(icon: Icon(Icons.add), onPressed: () {}),
        body: SafeArea(
          child: Column(
            children: [
              HomePageWidget(),
              Expanded(
                child: Consumer<ChatListRepository>(
                  builder: (context, chatListProvider, _) {
                    return ListView.builder(
                      itemCount: chatListProvider.chatList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatPage(),
                              ),
                            );
                            print(index);
                          },
                          child: chatListProvider.chatList[index],
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
