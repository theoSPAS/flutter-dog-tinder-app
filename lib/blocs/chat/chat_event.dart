import 'package:equatable/equatable.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class ChatRequested extends ChatEvent {
  final String petId;

  const ChatRequested({
    required this.petId,
  });
  @override
  List<Object> get props => [petId];
}