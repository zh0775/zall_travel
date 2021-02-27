import 'package:flutter/material.dart';

import 'package:zall_travel/Home/Home.dart';

import 'package:zall_travel/Wallet/Wallet.dart';
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
      body: Stack(
        overflow: Overflow.visible,
        children: [
          Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 0,
              child: IndexedStack(
                index: _tabbarIndex,
                children: [Home(), Wallet(), Message(), Mine()],
              )),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            height: 55,
            child: JMTabBar((index) {
              // indexClick();
              setState(() {
                _tabbarIndex = index;
              });
              // _tabbarIndex = index;
            }),
          )
        ],
      ),
      // bottomNavigationBar:
    );
  }
}
