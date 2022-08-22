// import 'package:cloud_firestore/cloud_firestore.dart';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// import 'package:mips_project/models/message.dart';
// import 'package:mips_project/models/messages_model.dart';
//
// import 'base_messageRepository.dart';
//
// class MessageRepository extends BaseMessageRepository{
//   final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
//
//   @override
//   Future<void> createMessage(Message message) async {
//     await _firebaseFirestore
//         .collection('chats')
//         .doc(message.id)
//         .set(message.toMap());
//   }
//
//   @override
//   Future<void> createPet(Pet pet) async {
//     await _firebaseFirestore
//         .collection('users')
//         .doc(pet.id)
//         .set(pet.toMap());
//   }
//
//   @override
//   Stream<Message> getMessage(String messageId) {
//     // TODO: implement getMessage
//     throw UnimplementedError();
//   }
//
//   @override
//   Stream<List<Message>> getMessages(String petId) {
//     // TODO: implement getMessages
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<void> updateMessage(Message message) {
//     // TODO: implement updateMessage
//     throw UnimplementedError();
//   }
//
//   // @override
//   // Future<void> deleteChat(String currentUserId, String selectedUserId)async {
//   //   await _firebaseFirestore
//   //       .collection('users')
//   //       .doc(currentUserId)
//   //       .collection('chats')
//   //       .doc(selectedUserId)
//   //       .delete();
//   // }
//
// }