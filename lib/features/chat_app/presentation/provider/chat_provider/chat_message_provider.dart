import 'dart:io';

import 'package:chat/core/constants/constants.dart';
import 'package:chat/features/chat_app/presentation/provider/auth_provider.dart';
import 'package:chat/features/chat_app/presentation/provider/chat_provider/chat_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ChatMessageProvider extends ChangeNotifier {
  late final BuildContext context;
  ChatMessageProvider(this.context);
  late final String currentUserId;

  int _limit = 20; // Initial limit value
  int _limitIncrement = 20;

  int get limit => _limit;
  final FocusNode focusNode = FocusNode();
  ScrollController listScrollController = ScrollController();
  final TextEditingController textEditingController = TextEditingController();
  List<QueryDocumentSnapshot> listMessage = [];

  late final ChatProvider chatProvider =
      Provider.of<ChatProvider>(context, listen: false);
  late final AuthProvider authProvider =
      Provider.of<AuthProvider>(context, listen: false);

  File? imageFile;
  bool isLoading = false;
  bool isShowSticker = false;
  String imageUrl = "";

  void increaseLimit() {
    _limit += _limitIncrement;
    notifyListeners();
  }

  scrollListener() {
    if (!listScrollController.hasClients) return;
    if (listScrollController.offset >=
            listScrollController.position.maxScrollExtent &&
        !listScrollController.position.outOfRange &&
        _limit <= listMessage.length) {
      increaseLimit();
      notifyListeners();
    }
  }

  @override
  void addListener(VoidCallback listener) {
    // TODO: implement addListener
    super.addListener(listener);
    listScrollController.addListener(scrollListener);
    notifyListeners();
  }

  void onFocusChange() {
    if (focusNode.hasFocus) {
      // Hide sticker when keyboard appear
      isShowSticker = false;
      notifyListeners();
    }
  }

  getSticker() {
    // Hide keyboard when sticker appear
    focusNode.unfocus();
    isShowSticker = !isShowSticker;
  }

  getImage(String groupChatId, String peerId) async {
    ImagePicker imagePicker = ImagePicker();
    XFile? pickedFile = await imagePicker
        .pickImage(source: ImageSource.gallery)
        .catchError((err) {
      Fluttertoast.showToast(msg: err.toString());
      return null;
    });
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      if (imageFile != null) {
        isLoading = true;

        uploadFile(groupChatId, peerId);
        notifyListeners();
      }
    }
  }

  uploadFile(String groupChatId, String peerId) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    UploadTask uploadTask = chatProvider.uploadFile(imageFile!, fileName);
    try {
      TaskSnapshot snapshot = await uploadTask;
      imageUrl = await snapshot.ref.getDownloadURL();

      isLoading = false;
      onSendMessage(imageUrl, TypeMessage.image, groupChatId, peerId);
    } on FirebaseException catch (e) {
      isLoading = false;

      Fluttertoast.showToast(msg: e.message ?? e.toString());
    }
  }

  onSendMessage(String content, int type, String groupChatId, String peerId) {
    if (content.trim().isNotEmpty) {
      textEditingController.clear();
      chatProvider.sendMessage(
          content, type, groupChatId, currentUserId, peerId);
      if (listScrollController.hasClients) {
        listScrollController.animateTo(0,
            duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
      }
    } else {
      Fluttertoast.showToast(
          msg: 'Nothing to send',
          backgroundColor: AppColors.transparentBackgroundColor);
    }
  }
}
