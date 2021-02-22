import 'package:flutter/material.dart';
import 'package:zall_travel/components/CustomAppBar.dart';
import 'package:zall_travel/components/Empty.dart';

class Message extends StatefulWidget {
  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        needBack: false,
        title: '消息',
      ),
      body: Empty(),
    );
  }
}
