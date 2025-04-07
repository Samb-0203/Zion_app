import 'package:flutter/material.dart';

class ChatsUserList extends StatefulWidget {
  const ChatsUserList({super.key});

  @override
  State<ChatsUserList> createState() => _ChatsUserListState();
}

class _ChatsUserListState extends State<ChatsUserList> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Chats list view',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
