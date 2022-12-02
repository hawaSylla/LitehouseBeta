// import 'dart:html';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('LiteHouse'),
          actions: [
            DropdownButton(
              icon: Icon(
                Icons.more_vert,
                color: Theme.of(context).colorScheme.primary,
              ),
              items: [
                DropdownMenuItem(
                  value: 'logout',
                  child: Container(
                    child: Row(
                      children: const <Widget>[
                        Icon(Icons.exit_to_app),
                        SizedBox(
                          width: 8,
                        ),
                        Text('logout'),
                      ],
                    ),
                  ),
                )
              ],
              onChanged: (itemIdentifier) {
                if (itemIdentifier == 'logout') {
                  FirebaseAuth.instance.signOut();
                }
              },
            )
          ],
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('chats/gzqTcYMq2UmQvdPAaO3r/messages')
              .snapshots(),
          builder: (context, streamSnapshot) {
            if (streamSnapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final documents = streamSnapshot.data?.docs;
            return ListView.builder(
                itemCount: streamSnapshot.data?.docs.length,
                itemBuilder: ((context, index) => Container(
                      padding: EdgeInsets.all(8),
                      child: Text(documents![index]['text']),
                    )));
          },
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              FirebaseFirestore.instance
                  .collection('chats/gzqTcYMq2UmQvdPAaO3r/messages')
                  .add({'text': 'This was added by clicking the button'});
            }));
  }
}
