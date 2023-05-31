import 'dart:async';
import 'package:chat/core/utils/debouncer.dart';
import 'package:chat/features/chat_app/presentation/provider/search_bar_provider.dart';

import 'package:flutter/material.dart';
import 'package:chat/core/constants/constants.dart';
import 'package:provider/provider.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  String _textSearch = "";
  final TextEditingController searchBarText = TextEditingController();
  final Debouncer searchDebouncer = Debouncer(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    SearchBarProvider searchBarProvider =
        Provider.of<SearchBarProvider>(context);
    return Container(
      height: fullHeight(context) * .09,
      width: fullWidth(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.transparentBackgroundColor,
      ),
      padding: const EdgeInsets.fromLTRB(16, 8, 5, 8),
      margin: const EdgeInsets.fromLTRB(5, 8, 5, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.search, color: AppColors.backgroundColor, size: 20),
          const SizedBox(width: 5),
          Expanded(
            child: TextFormField(
              textInputAction: TextInputAction.search,
              controller: searchBarText,
              onChanged: (value) {
                searchDebouncer.run(() {
                  if (value.isNotEmpty) {
                    searchBarProvider.showClearButton();
                    _textSearch = value;
                  } else {
                    searchBarProvider.hideClearButton();
                    _textSearch = "";
                  }
                });
              },
              decoration: const InputDecoration.collapsed(
                hintText: 'Search with user name.',
                hintStyle: TextStyle(fontSize: 13, color: AppColors.textColor),
              ),
              style: const TextStyle(fontSize: 13),
            ),
          ),
          Consumer<SearchBarProvider>(
            builder: (context, provider, _) {
              return StreamBuilder<bool>(
                stream: provider.btnClearStream,
                builder: (context, snapshot) {
                  return snapshot.data == true
                      ? GestureDetector(
                          onTap: () {
                            searchBarText.clear();
                            provider.hideClearButton();
                            _textSearch = "";
                          },
                          child: const Icon(
                            Icons.clear_rounded,
                            color: AppColors.backgroundColor,
                            size: 20,
                          ),
                        )
                      : const SizedBox.shrink();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
