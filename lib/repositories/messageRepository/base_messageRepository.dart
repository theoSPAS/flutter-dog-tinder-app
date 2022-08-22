import 'package:mips_project/models/messages_model.dart';

abstract class BaseMessageRepository{
 Stream<Message> getMessage(String messageId);
 Stream<List<Message>> getMessages(String petId);
 Future<void> createMessage(Message message);
 Future<void> updateMessage(Message message);
}