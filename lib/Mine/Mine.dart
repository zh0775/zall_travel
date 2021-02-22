import 'package:flutter/material.dart';
import 'package:zall_travel/components/CustomAppBar.dart';
import 'package:zall_travel/components/Empty.dart';

class Mine extends StatefulWidget {
  @override
  _MineState createState() => _MineState();
}

class _MineState extends State<Mine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        needBack: false,
        title: '我的',
      ),
      body: Empty(),
    );
  }
}
