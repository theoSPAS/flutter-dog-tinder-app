import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mips_project/helpers/values/colors.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isMe;

  const MessageBubble({required this.message, Key? key, required this.isMe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isMe ? kGrayAppBarColor : kBlueMainColorOne,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(12),
              topRight: const Radius.circular(12),
              bottomLeft: !isMe ? const Radius.circular(0) : const Radius.circular(12),
              bottomRight: isMe ? const Radius.circular(0) : const Radius.circular(12)
            )
          ),
          width: 160,
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10
          ),
          margin: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 8
          ),
          child: Text(message,
          style: GoogleFonts.lora(
            textStyle: Theme.of(context).textTheme.titleMedium,
            color: isMe ? kColorBlack : kColorWhite
          ),),
        ),
      ],
    );
  }
}
