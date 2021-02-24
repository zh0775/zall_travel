import 'package:flutter/material.dart';
import 'package:zall_travel/Destination/Destination.dart';
import 'package:zall_travel/Home/Home.dart';
import 'package:zall_travel/Journey/Journey.dart';
import 'package:zall_travel/tabbar.dart';

import 'Message/Message.dart';
import 'Mine/Mine.dart';

class MainPageWidget extends StatefulWidget {
  @override
  _MainPageWidgetState createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget> {
  int _tabbarIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _tabbarIndex,
        children: [Home(), Destination(), Message(), Journey(), Mine()],
      ),
      bottomNavigationBar: JMTabBar((index) {
        // indexClick();
        setState(() {
          _tabbarIndex = index;
        });
        // _tabbarIndex = index;
      }),
    );
  }
}
