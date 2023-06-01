import 'dart:ui';

import 'package:chat/core/constants/firestore_constants.dart';
import 'package:chat/core/utils/diaglog_functions.dart';
import 'package:chat/core/utils/keyboard.dart';
import 'package:chat/features/chat_app/data/models/chat_message_model.dart';
import 'package:chat/features/chat_app/data/models/chat_page_arguments_model.dart';
import 'package:chat/features/chat_app/presentation/provider/chat_provider/chat_list_provider.dart';
import 'package:chat/features/chat_app/presentation/provider/home_page_provider.dart';
import 'package:chat/features/chat_app/presentation/pages/chat_page.dart';
import 'package:chat/features/chat_app/presentation/widgets/home_page_widget/app_bar_widget.dart';
import 'package:chat/features/chat_app/presentation/widgets/home_page_widget/search_widget.dart';
import 'package:chat/features/chat_app/presentation/widgets/loading.dart';
import 'package:chat/features/chat_app/presentation/provider/auth_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:chat/core/constants/constants.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? currentUserId;

  String _textSearch = "";
  bool isLoading = false;

  late final AuthProvider authProvider = context.read<AuthProvider>();
  late final HomePageProvider homePageProvider =
      context.read<HomePageProvider>();
  late final ChatListProvider chatListProvider =
      Provider.of<ChatListProvider>(context, listen: false);

  @override
  void initState() {
    super.initState();

    if (authProvider.getUserFirebaseId()?.isNotEmpty == true) {
      currentUserId = authProvider.getUserFirebaseId()!;
    } else {
      Navigator.pushNamed(context, '/loginPage');
    }

    chatListProvider.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () => onBackPress(context),
          child: Stack(
            children: <Widget>[
              Column(
                children: [
                  const AppBarWidget(),
                  const SearchBarWidget(),
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: homePageProvider.getStreamFireStore(
                          FirestoreConstants.pathUserCollection,
                          chatListProvider.limit,
                          _textSearch),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasData) {
                          if ((snapshot.data?.docs.length ?? 0) > 0) {
                            return ListView.builder(
                              padding: const EdgeInsets.all(10),
                              itemBuilder: (context, index) => buildItem(
                                  context, snapshot.data?.docs[index]),
                              itemCount: snapshot.data?.docs.length,
                              controller: chatListProvider.listScrollController,
                            );
                          } else {
                            return const Center(
                              child: Text("No users"),
                            );
                          }
                        } else {
                          return const LoadingViewCenter();
                        }
                      },
                    ),
                  ),
                ],
              ),
              Positioned(
                  child: isLoading ? LoadingView() : const SizedBox.shrink()),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildItem(BuildContext context, DocumentSnapshot? document) {
    if (document != null) {
      UserChat userChat = UserChat.fromDocument(document);
      if (userChat.id == currentUserId) {
        return const SizedBox.shrink();
      } else {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            child: TextButton(
              onPressed: () {
                if (KeyBoardUtil.isKeyboardShowing()) {
                  KeyBoardUtil.closeKeyboard(context);
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatPage(
                      arguments: ChatPageArguments(
                        peerId: userChat.id,
                        peerAvatar: userChat.photoUrl,
                        peerName: userChat.name,
                      ),
                    ),
                  ),
                );
                // Navigator.pushNamed(context, '/chatPage');
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      AppColors.transparentBackgroundColor),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                      const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(25))))),
              child: Row(
                children: <Widget>[
                  Material(
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                    clipBehavior: Clip.hardEdge,
                    child: userChat.photoUrl.isNotEmpty
                        ? Image.network(
                            userChat.photoUrl,
                            fit: BoxFit.cover,
                            width: 50,
                            height: 50,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Container(
                                width: 50,
                                height: 50,
                                child: Center(
                                  child: LoadingViewImage(
                                      loadingProgress: loadingProgress),
                                ),
                              );
                            },
                            errorBuilder: (context, object, stackTrace) {
                              return const Icon(
                                Icons.account_circle,
                                size: 50,
                                color: AppColors.backgroundColor,
                              );
                            },
                          )
                        : const Icon(
                            Icons.account_circle,
                            size: 50,
                            color: AppColors.backgroundColor,
                          ),
                  ),
                  Flexible(
                    child: Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.fromLTRB(10, 0, 0, 5),
                            child: Text(
                              'Name: ${userChat.name} ',
                              maxLines: 1,
                              style:
                                  const TextStyle(color: AppColors.textColor),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    } else {
      return const SizedBox.shrink();
    }
  }
}
