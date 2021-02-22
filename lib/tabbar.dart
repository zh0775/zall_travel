import 'package:zall_travel/const/Default.dart';
import 'package:zall_travel/utils/EventBus.dart';
import 'package:zall_travel/utils/notify_default.dart';
import 'package:flutter/material.dart';
import 'package:zall_travel/components/NoneV.dart';
import 'package:zall_travel/utils/sizeConfig.dart';

typedef void OnTabItemClick(int index);

class JMTabBar extends StatefulWidget {
  final OnTabItemClick tabItemClick;
  JMTabBar(this.tabItemClick);
  @override
  _JMTabBarState createState() => _JMTabBarState();
}

class _JMTabBarState extends State<JMTabBar> {
  double widthScale;
  EventBus _bus = EventBus();
  int _currentIndex = 0;
  int waitClientCount = 0;
  @override
  void initState() {
    _bus.on(NOTIFY_CLIENTWAIT_COUNT, (arg) {
      if (mounted) {
        setState(() {
          waitClientCount = arg;
        });
      }
    });
    _bus.on(NOTIFY_CHANGE_TABBAR_INDEX, (arg) {
      if (mounted) {
        if (widget.tabItemClick != null) {
          widget.tabItemClick(arg);
        }
        setState(() {
          _currentIndex = arg;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _bus.off(NOTIFY_CLIENTWAIT_COUNT);
    _bus.off(NOTIFY_CHANGE_TABBAR_INDEX);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    widthScale = SizeConfig.blockSizeHorizontal;
    return BottomNavigationBar(
      selectedFontSize: 13,
      unselectedFontSize: 13,
      selectedItemColor: jm_text_black,

      unselectedItemColor: jm_text_gray,
      // selectedLabelStyle: jm_text_black_bold_style13,
      // unselectedLabelStyle: jm_text_gray_style13,
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      items: [
        createItem('1', '首页'),
        createItem('2', '目的地'),
        createItem('3', '消息'),
        createItem('4', '行程'),
        createItem('5', '我的')
      ],
      onTap: (index) {
        if (widget.tabItemClick != null) {
          widget.tabItemClick(index);
        }
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }

  BottomNavigationBarItem createItem(String iconName, String title,
      {bool have = false, int count = 0}) {
    return BottomNavigationBarItem(
        icon: Container(
          height: 30,
          width: 30,
          child: Stack(
            overflow: Overflow.visible,
            children: [
              Positioned.fill(
                  child: Center(
                child: Image.asset(
                  "assets/images/tabbar/tabbar-$iconName.png",
                  width: widthScale * 7,
                  fit: BoxFit.fill,
                ),
              )),
              have && count != null && count > 0
                  ? Positioned(
                      top: -2.5,
                      right: -2.5,
                      child: Container(
                        width: 18,
                        height: 18,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(9)),
                        child: Text(
                          count > 99 ? '99' : count.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ))
                  : NoneV()
            ],
          ),
        ),
        activeIcon: Container(
          width: 30,
          height: 30,
          child: Stack(
            overflow: Overflow.visible,
            children: [
              Positioned.fill(
                  child: Center(
                child: Image.asset(
                  "assets/images/tabbar/tabbar-$iconName-active.png",
                  width: widthScale * 7,
                  fit: BoxFit.fill,
                ),
              )),
              have && count != null && count > 0
                  ? Positioned(
                      top: -2.5,
                      right: -2.5,
                      child: Container(
                        width: 18,
                        height: 18,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(9)),
                        child: Text(
                          count.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ))
                  : NoneV()
            ],
          ),
        ),
        label: title);
  }
}
