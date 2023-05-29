import 'package:flutter/material.dart';
import 'package:chat/features/chat_app/presentation/widgets/home_page_widget.dart';

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
    return HomePageWidget();
  }
}
