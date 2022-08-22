import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mips_project/features/chat/widgets/message_bubble.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
        future: Future.value(FirebaseAuth.instance.currentUser),
        builder: (context, futureSnapshot) {
          if (futureSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('chat')
                  .orderBy('createdAt', descending: true)
                  .snapshots(),
              builder: (context, chatSnapshots) {
                if (chatSnapshots.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final chatDocs = chatSnapshots.data!.docs;
                return ListView.builder(
                    reverse: true,
                    itemCount: chatSnapshots.data!.docs.length,
                    itemBuilder: (context, index) => MessageBubble(
                        key: ValueKey(chatDocs[index].id),
                        isMe: chatDocs[index]['userId'] ==
                            futureSnapshot.data!.uid,
                        message: chatDocs[index]['text']));
              });
        });
  }
}
