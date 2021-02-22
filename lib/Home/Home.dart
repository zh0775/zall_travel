import 'package:flutter/material.dart';
import 'package:zall_travel/Home/components/HomeCell.dart';
import 'package:zall_travel/Home/components/HomeTopSearch.dart';
import 'package:zall_travel/const/Default.dart';
import 'package:zall_travel/utils/sizeConfig.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController scrollController = ScrollController();
  double widthScale;
  double margin;
  double selfWidth;
  int tabIndex = 0;
  List dataList = [
    {
      'image': 'scenic2.jpeg',
      'title': '赤壁市杨洞楼',
      'userName': '我是FIORELADY',
      'userHead': 'userHead.jpeg',
      'likeCount': 86
    },
    {
      'image': 'scenic3.jpeg',
      'title': '曹禺文化旅游路线',
      'userName': '释迦马天尼',
      'userHead': 'userHead.jpeg',
      'likeCount': 24
    },
    {
      'image': 'scenic1.jpeg',
      'title': '茶园',
      'userName': '我是FIORELADY',
      'userHead': 'userHead.jpeg',
      'likeCount': 90
    },
    {
      'image': 'tiantangzhai.jpg',
      'title': '湖北天堂寨',
      'userName': '我是FIORELADY',
      'userHead': 'userHead.jpeg',
      'likeCount': 13
    },
    {
      'image': 'mihouleyuan.jpeg',
      'title': '神农架猕猴乐园',
      'userName': '我是FIORELADY',
      'userHead': 'userHead.jpeg',
      'likeCount': 22
    },
    {
      'image': 'muqiaoxi.jpeg',
      'title': '长阳木桥溪生态旅游度假区',
      'userName': '我是FIORELADY',
      'userHead': 'userHead.jpeg',
      'likeCount': 55
    },
    {
      'image': 'haosengou.jpeg',
      'title': '好森沟国家森林公园',
      'userName': '我是FIORELADY',
      'userHead': 'userHead.jpeg',
      'likeCount': 125
    },
    {
      'image': 'huashijie.jpeg',
      'title': '花世界',
      'userName': '我是FIORELADY',
      'userHead': 'userHead.jpeg',
      'likeCount': 98
    },
    {
      'image': 'shiliuhongcun.jpeg',
      'title': '石榴红乡村休闲旅游项目',
      'userName': '我是FIORELADY',
      'userHead': 'userHead.jpeg',
      'likeCount': 13
    },
    {
      'image': 'huangjishan.jpeg',
      'title': '黄荆山文化旅游生态公园',
      'userName': '我是FIORELADY',
      'userHead': 'userHead.jpeg',
      'likeCount': 546
    },
    {
      'image': 'fanwanhu.jpeg',
      'title': '返湾湖国家湿地公园',
      'userName': '我是FIORELADY',
      'userHead': 'userHead.jpeg',
      'likeCount': 84
    },
    {
      'image': 'taiyangshan.jpeg',
      'title': '太阳山景区',
      'userName': '我是FIORELADY',
      'userHead': 'userHead.jpeg',
      'likeCount': 23
    },
    {
      'image': 'nvwashan.jpg',
      'title': '女娲山风景区',
      'userName': '我是FIORELADY',
      'userHead': 'userHead.jpeg',
      'likeCount': 52
    },
    {
      'image': 'mulan.jpeg',
      'title': '木兰国际旅游度假区',
      'userName': '我是FIORELADY',
      'userHead': 'userHead.jpeg',
      'likeCount': 3
    },
    {
      'image': 'huanghualao.jpg',
      'title': '黄花涝水岸古镇',
      'userName': '我是FIORELADY',
      'userHead': 'userHead.jpeg',
      'likeCount': 1
    },
  ];

  // title: '曹禺文化旅游路线',
  //                             userHead: 'userHead.jpeg',
  //                             userName: '释迦马天尼',
  //                             likeCount: 24,

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    widthScale = SizeConfig.blockSizeHorizontal;
    margin = widthScale * 6;
    selfWidth = SizeConfig.screenWidth - margin * 2;
    return MediaQuery.removePadding(
        removeTop: true, context: context, child: homeBody());
  }

  Widget homeBody() {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        backgroundColor: Color(0xfff8fafc),
        appBar: PreferredSize(
            child: HomeTopSearch(),
            preferredSize: Size(SizeConfig.screenWidth, 100)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: margin,
                  ),
                  Text(
                    '热搜',
                    style: jm_text_black_style13,
                  ),
                  SizedBox(
                    width: widthScale * 2,
                  ),
                  JMline(width: 1, height: 12),
                  SizedBox(
                    width: widthScale * 2,
                  ),
                  Image.asset(
                    'assets/images/home/fire.png',
                    width: widthScale * 4.5,
                    height: widthScale * 4.5,
                  ),
                  SizedBox(
                    width: widthScale * 2,
                  ),
                  Text(
                    '桃花驿',
                    style: jm_text_black_style13,
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                width: selfWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    topButtons(
                      title: '攻略',
                      image: 'homeTop1',
                      buttonClick: () {},
                    ),
                    topButtons(
                      title: '游记',
                      image: 'homeTop2',
                      buttonClick: () {},
                    ),
                    topButtons(
                      title: '订酒店',
                      image: 'homeTop3',
                      buttonClick: () {},
                    ),
                    topButtons(
                      title: '景点预约',
                      image: 'homeTop4',
                      buttonClick: () {},
                    ),
                    topButtons(
                      title: '直播',
                      image: 'homeTop5',
                      buttonClick: () {},
                    ),
                    topButtons(
                      title: '自驾',
                      image: 'homeTop6',
                      buttonClick: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: SizeConfig.screenWidth,
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: selfWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          tabs(title: '发现', index: 0),
                          tabs(title: '周边', index: 1),
                          tabs(title: '赤壁', index: 2),
                          tabs(title: '咸宁', index: 3),
                          tabs(title: '潜江', index: 4),
                          Icon(
                            Icons.add_location,
                            size: widthScale * 6,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    HomeCell(
                      width: selfWidth,
                      height: 260,
                      image: 'scenic1.jpeg',
                      needUserBg: true,
                      title: '探索万亩茶园，聆听大自然的乐章！',
                      userHead: 'userHead.jpeg',
                      userName: '我是FIORELADY',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: selfWidth,
                      height: 80 + 240 * 2 + 190 * 6.0,
                      child: StaggeredGridView.extentBuilder(
                        physics: NeverScrollableScrollPhysics(),
                        // crossAxisCount: 4,
                        maxCrossAxisExtent: selfWidth / 4,
                        itemCount: 15,
                        itemBuilder: (BuildContext context, int index) {
                          // if (index == 0 || index )
                          Map data = dataList[index];
                          return HomeCell(
                            width: selfWidth / 2,
                            height: index == 0 || index % 3 == 0 ? 240 : 190,
                            image: data['image'],
                            // needUserBg: true,
                            title: data['title'],
                            userHead: data['userHead'],
                            userName: data['userName'],
                            likeCount: data['likeCount'],
                          );
                          // index.isEven

                          // if (index == 0 || index % 3 == 0) {
                          //   return HomeCell(
                          //     width: selfWidth / 2,
                          //     height: 240,
                          //     image: 'scenic2.jpeg',
                          //     // needUserBg: true,
                          //     title: '赤壁市杨洞楼',
                          //     userHead: 'userHead.jpeg',
                          //     userName: '我是FIORELADY',
                          //   );
                          // } else {
                          //   return HomeCell(
                          //     width: selfWidth / 2,
                          //     height: 190,
                          //     image: !index.isEven
                          //         ? 'scenic3.jpeg'
                          //         : 'scenic1.jpeg',
                          //     // needUserBg: true,
                          //     title: '曹禺文化旅游路线',
                          //     userHead: 'userHead.jpeg',
                          //     userName: '释迦马天尼',
                          //     likeCount: 24,
                          //   );
                          // }

                          // return HomeCell(
                          //   width: selfWidth / 2,
                          //   height: index == 0 || index % 3 == 0 ? 220 : 190,
                          //   image: 'scenic1.jpeg',
                          //   // needUserBg: true,
                          //   title: '探索万亩茶园，聆听大自然的乐章！',
                          //   userHead: 'userHead.jpeg',
                          //   userName: '我是FIORELADY',
                          // );
                        },
                        staggeredTileBuilder: (int index) =>
                            new StaggeredTile.extent(
                                2, index == 0 || index % 3 == 0 ? 240 : 190),
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget topButtons({String title, String image, Function() buttonClick}) {
    return RawMaterialButton(
      onPressed: buttonClick,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      constraints: BoxConstraints(minWidth: 0, minHeight: 0),
      child: Column(
        children: [
          Image.asset(
            'assets/images/home/$image.png',
            height: widthScale * 8,
            width: widthScale * 8,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: jm_text_gray_style11,
          )
        ],
      ),
    );
  }

  Widget tabs({String title, int index, Function(int index) click}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          tabIndex = index;
        });
        if (click != null) {
          click(index);
        }
      },
      child: Text(
        title,
        style: index == tabIndex
            ? jm_text_black_bold_style20
            : jm_text_black_style16,
      ),
    );
  }
}
