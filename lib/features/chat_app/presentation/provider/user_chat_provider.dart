import 'package:chat/core/constants/firestore_constants.dart';
import 'package:chat/features/chat_app/data/models/chat_message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserChatProvider {
  late UserChat userChat;
  late FirebaseFirestore firebaseFirestore;

  UserChatProvider({required this.firebaseFirestore});

  Stream<QuerySnapshot> getStreamFireStore(
      String pathCollection, int limit, String? textSearch) {
    if (textSearch?.isNotEmpty == true) {
      return firebaseFirestore
          .collection(pathCollection)
          .limit(limit)
          .where(FirestoreConstants.name, isEqualTo: textSearch)
          .snapshots();
    } else {
      return firebaseFirestore
          .collection(pathCollection)
          .limit(limit)
          .snapshots();
    }
  }
}
