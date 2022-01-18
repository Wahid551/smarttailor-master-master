import 'package:cloud_firestore/cloud_firestore.dart';

class AuthData{
 FirebaseFirestore _user=FirebaseFirestore.instance;
  // Add Chat
  Future addChatRoom(chatRoomId, chatRoom) async {
    await _user
        .collection("chatRoom")
        .doc(chatRoomId)
        .set(chatRoom)
        .catchError((e) {
      print(e);
    });
  }

 //Send Messages
 Future<void> addMessage(String chatRoomId, chatMessageData) async {
   _user
       .collection("chatRoom")
       .doc(chatRoomId)
       .collection("chats")
       .add(chatMessageData)
       .catchError((e) {
     print(e.toString());
   });
 }
 //get chat room
 getUserChats(String itIsMyName) async {
   return _user
       .collection("chatRoom")
       .where('users', arrayContains: itIsMyName)
       .snapshots();
 }
 // get chats
 getChats(String chatRoomId) async {
   return _user
       .collection("chatRoom")
       .doc(chatRoomId)
       .collection("chats")
       .orderBy('time')
       .snapshots();
 }


}
