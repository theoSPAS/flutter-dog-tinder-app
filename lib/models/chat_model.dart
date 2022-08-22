import 'package:equatable/equatable.dart';
import 'package:mips_project/models/messages_model.dart';

class Chat extends Equatable {
  final int id;
  final int petId;
  final int matchedPetId;
  final List<Message> messages;

  const Chat(
      {required this.id,
      required this.petId,
      required this.matchedPetId,
      required this.messages});

  @override
  List<Object?> get props => [id, petId, matchedPetId, messages];

  static List<Chat> chats = [
    Chat(
      id: 1,
      petId: 1,
      matchedPetId: 2,
      messages: Message.messages
          .where((message) =>
              (message.senderId == 1 && message.receiverId == 2) ||
              (message.senderId == 2 && message.receiverId == 1))
          .toList(),
    ),
    Chat(
      id: 2,
      petId: 1,
      matchedPetId: 3,
      messages: Message.messages
          .where((message) =>
              (message.senderId == 1 && message.receiverId == 3) ||
              (message.senderId == 3 && message.receiverId == 1))
          .toList(),
    ),
    Chat(
      id: 3,
      petId: 1,
      matchedPetId: 5,
      messages: Message.messages
          .where((message) =>
              (message.senderId == 1 && message.receiverId == 5) ||
              (message.senderId == 5 && message.receiverId == 1))
          .toList(),
    ),
    Chat(
      id: 4,
      petId: 1,
      matchedPetId: 6,
      messages: Message.messages
          .where((message) =>
              (message.senderId == 1 && message.receiverId == 6) ||
              (message.senderId == 6 && message.receiverId == 1))
          .toList(),
    ),
  ];
}
