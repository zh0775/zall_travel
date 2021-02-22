import 'package:flutter/material.dart';
import 'package:zall_travel/components/CustomAppBar.dart';
import 'package:zall_travel/components/Empty.dart';

class Destination extends StatefulWidget {
  @override
  _DestinationState createState() => _DestinationState();
}

class _DestinationState extends State<Destination> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        needBack: false,
        title: '目的地',
      ),
      body: Empty(),
    );
  }
}
