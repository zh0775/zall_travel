import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:zall_travel/components/CustomAppBar.dart';
import 'package:zall_travel/components/CustomButton.dart';
import 'package:zall_travel/components/Empty.dart';
import 'package:zall_travel/const/Default.dart';
import 'package:zall_travel/utils/sizeConfig.dart';

class Destination extends StatefulWidget {
  @override
  _DestinationState createState() => _DestinationState();
}

class _DestinationState extends State<Destination> {
  List dataList = [
    {
      'name': '乌林宴',
      'type': '文旅',
      'location': '黄冈美食',
      'image': 'wulinyan.png',
    },
    {
      'name': '罗田吊锅',
      'type': '文旅',
      'location': '黄冈美食',
      'image': 'luotiandiaoguo.png',
    },
    {
      'name': '肉糕',
      'type': '文旅',
      'location': '黄冈美食',
      'image': 'rougao.png',
    },
    {
      'name': '煨葫芦',
      'type': '文旅',
      'location': '黄冈美食',
      'image': 'weihulu.png',
    },
  ];

  double widthScale;
  double margin;
  double selfWidth;
  int _currentTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    widthScale = SizeConfig.blockSizeHorizontal;
    margin = widthScale * 6;
    selfWidth = SizeConfig.screenWidth - margin * 2;
    return Scaffold(
      backgroundColor: jm_bg_gray_color,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: SizeConfig.screenWidth,
              height: 430,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    height: 350,
                    child: Image.asset(
                      'assets/images/home/bg_hg.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      top: 100,
                      left: margin,
                      child: Container(
                        width: selfWidth,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                              child: Text(
                                '欢迎来到黄冈',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            Text(
                              '2019年国家正能量城市',
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 45,
                              decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: widthScale * 3,
                                    right: widthScale * 2),
                                child: Row(
                                  children: [
                                    // SizedBox(
                                    //   width: widthScale * 3,
                                    // ),
                                    Icon(
                                      Icons.search,
                                      size: widthScale * 6,
                                      color: Colors.white,
                                    ),
                                    Container(
                                      width: widthScale * 43,
                                      alignment: Alignment.centerLeft,
                                      constraints: BoxConstraints(
                                          minHeight: 45, maxHeight: 45),
                                      child: TextField(
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        maxLines: 1,
                                        decoration: InputDecoration(
                                          hintStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                          contentPadding: EdgeInsets.all(6),
                                          hintText: '请输入景点/酒店/关键词',
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.zero,
                                              borderSide: BorderSide.none),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 2, color: Colors.black26)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(7),
                                child: Image.asset(
                                    'assets/images/home/bg_hg_02.png'),
                              ),
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: margin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  centerButton(iconName: 'icon_mp.png'),
                  centerButton(iconName: 'icon_jd.png'),
                  centerButton(iconName: 'icon_ywgl.png'),
                  centerButton(iconName: 'icon_csgl.png'),
                  centerButton(iconName: 'icon_ggwh.png'),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                  width: selfWidth,
                  // height: 150,
                  child: Image.asset(
                    'assets/images/home/bg_hg_03.png',
                    fit: BoxFit.cover,
                  ),
                  decoration: BoxDecoration(boxShadow: const [
                    BoxShadow(
                        color: jm_text_gray,
                        offset: Offset(-1.0, 16.0), //阴影y轴偏移量
                        blurRadius: 0, //阴影模糊程度
                        spreadRadius: 0.1 //阴影扩散程度
                        )
                  ])),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: margin),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  getTab(title: '必吃美食', index: 0),
                  getTab(title: '必玩景点', index: 1),
                  getTab(title: '热点资讯', index: 2),
                  getTab(title: '必住酒店', index: 3),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: selfWidth,
              child: Wrap(
                spacing: widthScale * 3,
                runSpacing: widthScale * 3,
                children: [for (var item in dataList) hgCell(item)],
              ),
            ),
            SizedBox(
              height: 75,
            )
          ],
        ),
      ),
    );
  }

  Widget hgCell(Map data) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: Colors.white,
        width: (selfWidth - widthScale * 3) / 2,
        height: 230,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150,
              width: (selfWidth - widthScale * 3) / 2,
              child: Stack(
                children: [
                  Positioned.fill(
                      child: Image.asset(
                    'assets/images/home/${data['image']}',
                    fit: BoxFit.fitHeight,
                  )),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: widthScale * 10,
                      height: 23,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.black26,
                      ),
                      child: Text(
                        '美食',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                data['name'],
                style: jm_text_black_style16,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                data['type'],
                style: jm_text_gray_style14,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
                padding: EdgeInsets.only(left: 10),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Color(0xff1d8ae6), width: 1)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xff1d8ae6),
                        ),
                      ),
                    ))),
          ],
        ),
      ),
    );
  }

  Widget centerButton({String iconName, Function() onPressed}) {
    return CustomButton(
      onPressed: onPressed,
      child: Image.asset(
        'assets/images/home/$iconName',
      ),
    );
  }

  Widget getTab({String title, int index}) {
    return Padding(
      padding: EdgeInsets.only(right: 12.0),
      child: CustomButton(
        onPressed: () {
          if (_currentTabIndex != index) {
            setState(() {
              _currentTabIndex = index;
            });
          }
        },
        child: Column(
          children: [
            Text(
              title ?? '',
              style: _currentTabIndex == index
                  ? TextStyle(
                      color: Color(0xff1d8ae6),
                      fontSize: 17,
                      fontWeight: FontWeight.bold)
                  : jm_text_gray_style15,
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: widthScale * 8,
              height: 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: _currentTabIndex == index
                    ? Color(0xff1d8ae6)
                    : Colors.transparent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
