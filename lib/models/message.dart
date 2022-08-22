import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class MessageModel extends Equatable {
  String senderName, senderId, selectedUserId, text, photoUrl;
  File photo;
  Timestamp timestamp;

  MessageModel(
      {required this.senderName,
        required this.senderId,
        required this.selectedUserId,
        required this.text,
        required this.photoUrl,
        required this.photo,
        required this.timestamp});

  @override
  List<Object?> get props => [senderId, senderName, selectedUserId, text, photoUrl, photo, timestamp];
}