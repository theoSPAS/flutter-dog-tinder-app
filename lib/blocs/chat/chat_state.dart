import 'package:equatable/equatable.dart';
import 'package:mips_project/models/chat_model.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

class ChatInitial extends ChatState {}

class ChatLoadInProgress extends ChatState {}

class ChatLoadFailure extends ChatState {
  final String message;
  const ChatLoadFailure({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}

class ChatLoadSuccess extends ChatState {
  final List<Chat> chats;
  const ChatLoadSuccess({
    required this.chats,
  });
  @override
  List<Object> get props => [chats];
}