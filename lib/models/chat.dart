import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ChatModel extends Equatable{
  String name, photoUrl, lastMessagePhoto, lastMessage;
  Timestamp timestamp;

  ChatModel(
      {required this.name,
        required this.photoUrl,
        required this.lastMessagePhoto,
        required this.lastMessage,
        required this.timestamp});
  @override
  List<Object?> get props => [name, photoUrl, lastMessage, lastMessagePhoto, timestamp];
}