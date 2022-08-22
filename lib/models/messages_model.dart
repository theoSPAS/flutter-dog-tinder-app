import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class Message extends Equatable {
  final int id;
  final int senderId;
  final int receiverId;
  final String message;
  final DateTime dateTime;
  final String timeString;

  const Message(
      {required this.id,
      required this.senderId,
      required this.receiverId,
      required this.message,
      required this.dateTime,
      required this.timeString});

  @override
  List<Object?> get props => [id, senderId, receiverId, message, dateTime, timeString];

  static List<Message> messages = [
    Message(
        id: 1,
        senderId: 1,
        receiverId: 2,
        message: 'you here?',
        dateTime: DateTime.now(),
        timeString: DateFormat('jm').format(DateTime.now())),
    Message(
        id: 2,
        senderId: 2,
        receiverId: 1,
        message: 'Very good, thanks?',
        dateTime: DateTime.now(),
        timeString: DateFormat('jm').format(DateTime.now())),
    Message(
        id: 3,
        senderId: 1,
        receiverId: 2,
        message: 'Good as well. Thank you.?',
        dateTime: DateTime.now(),
        timeString: DateFormat('jm').format(DateTime.now())),
    Message(
        id: 4,
        senderId: 1,
        receiverId: 3,
        message: 'hey',
        dateTime: DateTime.now(),
        timeString: DateFormat('jm').format(DateTime.now())),
    Message(
        id: 5,
        senderId: 3,
        receiverId: 1,
        message: 'Hey, great!',
        dateTime: DateTime.now(),
        timeString: DateFormat('jm').format(DateTime.now())),
    Message(
        id: 6,
        senderId: 1,
        receiverId: 5,
        message: 'Nice to meet you! How are you?',
        dateTime: DateTime.now(),
        timeString: DateFormat('jm').format(DateTime.now())),
    Message(
        id: 7,
        senderId: 5,
        receiverId: 1,
        message: 'Hey',
        dateTime: DateTime.now(),
        timeString: DateFormat('jm').format(DateTime.now())),
    Message(
        id: 8,
        senderId: 1,
        receiverId: 6,
        message: 'how are you? 8',
        dateTime: DateTime.now(),
        timeString: DateFormat('jm').format(DateTime.now())),
    Message(
        id: 9,
        senderId: 6,
        receiverId: 1,
        message: 'Fine, you?',
        dateTime: DateTime.now(),
        timeString: DateFormat('jm').format(DateTime.now())),
    Message(
        id: 10,
        senderId: 1,
        receiverId: 7,
        message: 'how are you? 10',
        dateTime: DateTime.now(),
        timeString: DateFormat('jm').format(DateTime.now())),
    Message(
        id: 11,
        senderId: 7,
        receiverId: 1,
        message: 'Not so good..',
        dateTime: DateTime.now(),
        timeString: DateFormat('jm').format(DateTime.now())),
  ];
}
