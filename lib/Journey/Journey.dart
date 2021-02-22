import 'package:flutter/material.dart';
import 'package:zall_travel/components/CustomAppBar.dart';
import 'package:zall_travel/components/Empty.dart';

class Journey extends StatefulWidget {
  @override
  _JourneyState createState() => _JourneyState();
}

class _JourneyState extends State<Journey> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        needBack: false,
        title: '行程',
      ),
      body: Empty(),
    );
  }
}
