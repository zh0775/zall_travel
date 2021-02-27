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
  double margin;
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
    margin = widthScale * 3;
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: SizeConfig.screenWidth - margin * 2,
        height: 55,
        decoration: BoxDecoration(
          color: Colors.white60,
          borderRadius: BorderRadius.circular(55 / 2),
          // boxShadow: const [
          //   BoxShadow(blurRadius: 5, color: jm_text_gray),
          // ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: widthScale * 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              tabBarItem(icons: Icons.home_rounded, title: '首页', index: 0),
              tabBarItem(
                  icons: Icons.account_balance_wallet_rounded,
                  title: '钱包',
                  index: 1),
              tabBarItem(icons: Icons.list_alt_rounded, title: '订单', index: 2),
              tabBarItem(icons: Icons.person_rounded, title: '我的', index: 3),
            ],
          ),
        ),
      ),
    );

    // BottomNavigationBar(
    //   selectedFontSize: 13,
    //   unselectedFontSize: 13,
    //   selectedItemColor: jm_text_black,

    //   unselectedItemColor: jm_text_gray,
    //   // selectedLabelStyle: jm_text_black_bold_style13,
    //   // unselectedLabelStyle: jm_text_gray_style13,
    //   currentIndex: _currentIndex,
    //   type: BottomNavigationBarType.fixed,
    //   items: [
    //     createItem('1', '首页'),
    //     createItem('2', '目的地'),
    //     createItem('3', '消息'),
    //     createItem('4', '行程'),
    //     createItem('5', '我的')
    //   ],
    //   onTap: (index) {
    //     if (widget.tabItemClick != null) {
    //       widget.tabItemClick(index);
    //     }
    //     setState(() {
    //       _currentIndex = index;
    //     });
    //   },
    // );
  }

  Widget tabBarItem({String title, IconData icons, int index}) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (index != _currentIndex) {
          setState(() {
            _currentIndex = index;
          });

          if (widget.tabItemClick != null) {
            widget.tabItemClick(index);
          }
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: widthScale * 15,
          ),
          Icon(
            icons,
            size: widthScale * 7,
            color: index == _currentIndex ? Color(0xfff55426) : jm_text_black,
          ),
          Text(
            title ?? '',
            style: index == _currentIndex
                ? TextStyle(color: Color(0xfff55426), fontSize: 13)
                : jm_text_black_style12,
          ),
        ],
      ),
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
