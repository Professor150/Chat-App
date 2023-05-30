import 'dart:io';

import 'package:chat/core/constants/constants.dart';
import 'package:chat/core/constants/firestore_constants.dart';
import 'package:chat/features/chat_app/presentation/provider/auth_provider.dart';
import 'package:chat/features/chat_app/presentation/provider/home_page_provider.dart';
import 'package:chat/features/chat_app/presentation/widgets/home_page_widget.dart';
import 'package:chat/features/chat_app/presentation/widgets/home_page_widget/app_bar_widget.dart';
import 'package:chat/features/chat_app/presentation/widgets/home_page_widget/chat_list_widget.dart';
import 'package:chat/features/chat_app/presentation/widgets/home_page_widget/search_widget.dart';
import 'package:chat/features/chat_app/presentation/widgets/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final AuthProvider authProvider = context.read<AuthProvider>();
  late final HomePageProvider homePageProvider =
      context.read<HomePageProvider>();
  String _textSearch = "";
  bool isLoading = false;
  late ScrollController listScrollController = ScrollController();
  int _limit = 20;
  final time = DateFormat().locale;

  Future<bool> onBackPress() {
    openDialog();
    return Future.value(false);
  }

  Future<void> openDialog() async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            clipBehavior: Clip.hardEdge,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                color: AppColors.transparentBackgroundColor,
                padding: EdgeInsets.only(bottom: 10, top: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.exit_to_app,
                        size: 30,
                        color: Colors.white,
                      ),
                      margin: EdgeInsets.only(bottom: 10),
                    ),
                    Text(
                      'Exit app',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Are you sure to exit app?',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 0);
                },
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.cancel,
                        color: AppColors.backgroundColor,
                      ),
                      margin: EdgeInsets.only(right: 10),
                    ),
                    Text(
                      'Cancel',
                      style: TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 1);
                },
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.check_circle,
                        color: AppColors.backgroundColor,
                      ),
                      margin: EdgeInsets.only(right: 10),
                    ),
                    Text(
                      'Yes',
                      style: TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          );
        })) {
      case 0:
        break;
      case 1:
        exit(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return HomePageWidget();
  }
}
