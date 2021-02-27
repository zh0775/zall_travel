import 'package:flutter/material.dart';
import 'package:zall_travel/Nearby/componets/nearby_cell.dart';
import 'package:zall_travel/components/CustomButton.dart';
import 'package:zall_travel/const/Default.dart';
import 'package:zall_travel/utils/sizeConfig.dart';

class Nearby extends StatefulWidget {
  @override
  _NearbyState createState() => _NearbyState();
}

class _NearbyState extends State<Nearby> {
  double widthScale;
  double margin;
  double selfWidth;
  int _currentTabIndex = 0;
  List dataList = [
    {
      'name': '双善洞',
      'near': '0.1km',
      'location': '湖北省黄冈市田家镇',
      'image': 'fanwanhu.jpeg'
    },
    {
      'name': '赤龙湖华中...',
      'near': '0.1km',
      'location': '黄冈市蕲春县蓟州镇西角湖影...',
      'image': 'fanwanhu.jpeg'
    },
    {
      'name': '东坡赤壁文化',
      'near': '0.1km',
      'location': '湖北省黄冈市田家镇',
      'image': 'fanwanhu.jpeg'
    },
    {
      'name': '双善洞',
      'near': '0.1km',
      'location': '湖北省黄冈市田家镇',
      'image': 'fanwanhu.jpeg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    widthScale = SizeConfig.blockSizeHorizontal;
    margin = widthScale * 6;
    selfWidth = SizeConfig.screenWidth - margin * 2;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '黄冈',
              style: jm_text_black_bold_style18,
            ),
            Icon(
              Icons.arrow_drop_down_rounded,
              size: widthScale * 9,
              color: Color(0xff1e8bef),
            )
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: widthScale * 3),
            child: Icon(
              Icons.search_rounded,
              size: widthScale * 8,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: SizeConfig.screenWidth,
              child: Image.asset(
                'assets/images/home/bg_nearby_top.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              // height: 30,
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: jm_line_color))),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    getTab(title: '景点', index: 0),
                    getTab(title: '酒店', index: 1),
                    getTab(title: '美食', index: 2),
                    getTab(title: '购物', index: 3),
                    getTab(title: '地铁/公交', index: 4),
                    getTab(title: '机场/车站', index: 5),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            ...nearbyCell()
          ],
        ),
      ),
    );
  }

  List<Widget> nearbyCell() {
    List<Widget> list = [];
    for (var i = 0; i < dataList.length; i++) {
      Map data = dataList[i];
      list.add(NearbyCell(
        data: data,
      ));
    }
    return list;
  }

  Widget getTab({String title, int index}) {
    return CustomButton(
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
                ? jm_text_black_bold_style17
                : jm_text_gray_style15,
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: widthScale * 6,
            height: 2,
            color: _currentTabIndex == index
                ? Color(0xfff24223)
                : Colors.transparent,
          )
        ],
      ),
    );
  }
}
