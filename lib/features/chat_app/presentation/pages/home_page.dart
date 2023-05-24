import 'package:flutter/material.dart';
import 'package:chat/core/utils/constants.dart';
import 'package:chat/features/chat_app/presentation/widgets/home_page_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            HomePageWidget(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    HomePageChatWidget(name: 'Name', time: '7:45 pm'),
                    HomePageChatWidget(name: 'Name', time: '7:45 pm'),
                    HomePageChatWidget(name: 'Name', time: '7:45 pm'),
                    HomePageChatWidget(name: 'Name', time: '7:45 pm'),
                    HomePageChatWidget(name: 'Name', time: '7:45 pm'),
                    HomePageChatWidget(name: 'Name', time: '7:45 pm'),
                    HomePageChatWidget(name: 'Name', time: '7:45 pm'),
                    HomePageChatWidget(name: 'Name', time: '7:45 pm'),
                    HomePageChatWidget(name: 'Name', time: '7:45 pm'),
                    HomePageChatWidget(name: 'Name', time: '7:45 pm')
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
