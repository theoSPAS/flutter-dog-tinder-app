import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../helpers/sizes.dart';
import '../../../helpers/values/colors.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _controller = TextEditingController();
  var _enteredMessage = '';

  void _sendMessage() async {
    FocusScope.of(context).unfocus();

    var user= FirebaseAuth.instance.currentUser;

    FirebaseFirestore.instance.collection('chat')
    .add({
      'text' : _enteredMessage,
      'createdAt' : Timestamp.now(),
      'userId' : user!.uid
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              onChanged: (value){
                setState(() {
                  _enteredMessage = value;
                });
           },
          decoration: InputDecoration(
              filled: true,
              fillColor: kColorWhite,
              hintText: 'Type here...',
              contentPadding: EdgeInsets.only(
                left: width(context) * 0.02,
                bottom: width(context) * 0.002,
              ),
              focusedBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.transparent)),
              enabledBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.transparent))),
            ),
          ),
          IconButton(
            color: kBlueMainColorOne,
            icon: const Icon(Icons.send),
            onPressed: _enteredMessage.trim().isEmpty ?
                null : _sendMessage
          )
        ],
      ),
    );
  }
}
