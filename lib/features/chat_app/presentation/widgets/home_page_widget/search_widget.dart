import 'dart:async';
import 'package:chat/core/utils/debouncer.dart';

import 'package:flutter/material.dart';
import 'package:chat/core/constants/constants.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  String _textSearch = "";

  final Debouncer searchDebouncer = Debouncer(milliseconds: 300);
  final StreamController<bool> btnClearController = StreamController<bool>();
  final TextEditingController searchBarTec = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    btnClearController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: fullHeight(context) * .09,
      width: fullWidth(context),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.search, color: AppColors.backgroundColor, size: 20),
          SizedBox(width: 5),
          Expanded(
            child: TextFormField(
              textInputAction: TextInputAction.search,
              controller: searchBarTec,
              onChanged: (value) {
                searchDebouncer.run(() {
                  if (value.isNotEmpty) {
                    btnClearController.add(true);
                    setState(() {
                      _textSearch = value;
                    });
                  } else {
                    btnClearController.add(false);
                    setState(() {
                      _textSearch = "";
                    });
                  }
                });
              },
              decoration: InputDecoration.collapsed(
                hintText: 'Search with user name.',
                hintStyle: TextStyle(fontSize: 13, color: AppColors.textColor),
              ),
              style: TextStyle(fontSize: 13),
            ),
          ),
          StreamBuilder<bool>(
              stream: btnClearController.stream,
              builder: (context, snapshot) {
                return snapshot.data == true
                    ? GestureDetector(
                        onTap: () {
                          searchBarTec.clear();
                          btnClearController.add(false);
                          setState(() {
                            _textSearch = "";
                          });
                        },
                        child: Icon(Icons.clear_rounded,
                            color: AppColors.backgroundColor, size: 20))
                    : SizedBox.shrink();
              }),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.transparentBackgroundColor,
      ),
      padding: EdgeInsets.fromLTRB(16, 8, 5, 8),
      margin: EdgeInsets.fromLTRB(5, 8, 5, 0),
    );
  }
}
